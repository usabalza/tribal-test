import Foundation
import Alamofire

enum ServiceResponseStatus<T>{
    case success(_ model: T)
    case failure(_ msg: String)
}
enum APIResponse<T:Codable>{
    case success(_ m: T)
    case failure(_ error: ResponseError)
}
class EmptyModel: Codable {
    
}
class APIService {
    
    static let baseURL = API_BASE_URL
    
    static var serverDateFormatter : DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }
    
    private static func printRequest(url: String,headers: [String:String]) {
        print("\n----------------------API REQUEST----------------------\n")
        print("\nRequest URL: \n\n" + String(describing: url))
        print("\nRequest HEADERS: \n\n" + String(describing: headers))
    }
    
    private static func printResponse(response: DataResponse<Any>) {
        print("\n----------------------API RESPONSE----------------------\n")
        print("\nRequest URL: \n\n" + String(describing: response.request?.url?.absoluteString))
        
//        if let data = response.request?.httpBody {
//            print("\nRequest Body: \n\n" + String(data: data, encoding: String.Encoding.utf8)!)
//        }
        
        if let data = response.data {
            print("\nResponse Body: \n\n" + String(data: data, encoding: String.Encoding.utf8)!)
        }
        
        print("\nResponse Code: \n\n" + String(describing: response.response?.statusCode))
        
    }
    
    @discardableResult static func downloadRequest(url: String, completion: @escaping (ResponseError?, Int) -> Void) -> DownloadRequest?{
        print("Downloading \(url)")
        let destination = DownloadRequest.suggestedDownloadDestination(for: .documentDirectory)
        return Alamofire.download(url, to: destination).responseData { response in
            
            guard let statusCode =  response.response?.statusCode else {
                let error = ResponseError.init(msg: "No se encuentra el estatus de la petición")
                m{
                    completion(error,0)
                }
                return
            }
            
            switch response.result {
            case .success:
                m{
                    completion(nil,statusCode)
                }
            case .failure(let error):
                let error = ResponseError.init(msg: error.localizedDescription)
                m{
                    completion(error,0)
                }
            }
        }
    }
    
    @discardableResult static func request<T:Codable>(method: HTTPMethod = .get, useBase: Bool = true, auth: Bool = true, endpoint: String, responseType: T.Type, multipart: Bool = false, xHeaders: [String: String]? = nil, completion: @escaping (APIResponse<T>, Int) -> Void) -> DataRequest? {
        return request(method: method, useBase: useBase, auth: auth, endpoint: endpoint, body: EmptyModel(), responseType: responseType, multipart: multipart,xHeaders: xHeaders, completion: completion)
    }
    @discardableResult static func request<T:Codable, B: Codable>(method: HTTPMethod = .get,useBase: Bool = true, auth: Bool = true, endpoint: String, body: B, responseType: T.Type, multipart: Bool = false, xHeaders: [String: String]? = nil, completion: @escaping (APIResponse<T>, Int) -> Void) -> DataRequest? {
        
        var url = baseURL + endpoint
        if !useBase{
            url = endpoint
        }
        
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(serverDateFormatter)
        
        guard let parameters = try? body.asDictionary(encoder: encoder) else {
            let error = ResponseError.init(msg: "No se pudo serializar el cuerpo de la petición")
            m{
                completion(.failure(error),0)
            }
            return nil
        }
        
        
        var headers = [String:String]()
        if let xH = xHeaders{
            xH.forEach { (k,v) in headers[k] = v }
        }
        
        /*if auth {
            guard let currentSession = Session.current else {
                let error = ResponseError.init(msg: "La sesión no fue encontrada")
                m{
                    completion(.failure(error),0)
                }
                return nil
            }
            
            headers = [
                "authorization": currentSession.token
            ]
        }*/
        headers = [
            "authorization": "Client-ID \(ACCESS_KEY)"
        ]
        var encoding: ParameterEncoding = JSONEncoding.default
        
        if case HTTPMethod.get = method{
            encoding = URLEncoding.default
        }
        if multipart{
            headers["Content-type"] = "multipart/form-data"

            Alamofire.upload(multipartFormData: { (multipartFormData) in
                
                for (key, value) in parameters {
                    if let v = value as? [String : String]{
                        multipartFormData.append(URL.init(fileURLWithPath: v["path"]!), withName: key, fileName: v["name"]!, mimeType: v["ext"]!)
                    }else{
                        multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
                    }
                }
                
                
            }, usingThreshold: UInt64.init(), to: url, method: method, headers: headers) { (result) in
                switch result{
                case .success(let upload, _, _):
                    upload.validate(statusCode: 200..<300).responseJSON { response in
                        printResponse(response: response)
                        
                        guard let statusCode =  response.response?.statusCode else {
                            let error = ResponseError.init(msg: "Ups un error ha ocurrido")
                            m{
                                completion(.failure(error),0)
                            }
                            return
                        }
                        
                        /*if statusCode == 403 && auth{
                            m{
                                utils.expiredToken()
                            }
                            return
                        }*/
                        
                        switch response.result {
                        case .success:
                            
                            if let data = response.data {
                                let decoder = JSONDecoder()
                                decoder.dateDecodingStrategy = .formatted(serverDateFormatter)
                                do{
                                    
                                    let object = try decoder.decode(T.self, from: data)
                                    m{
                                        completion(.success(object),statusCode)
                                    }
                                }catch{
                                    print(error)
                                    do{
                                        let object = try decoder.decode(ResponseError.self, from: data)
                                        m{
                                            completion(.failure(object),statusCode)
                                        }
                                    }catch{
                                        print(error)
                                        let error = ResponseError.init(msg: "Ups, un error ha ocurrido")
                                        m{
                                            completion(.failure(error),statusCode)
                                        }
                                    }
                                }
                            }
                            break
                        case .failure(let error):
                            print("\nError: \n\n" + error.localizedDescription)
                            let decoder = JSONDecoder()
                            decoder.dateDecodingStrategy = .formatted(serverDateFormatter)
                            if let data = response.data{
                                do{
                                    let object = try decoder.decode(ResponseError.self, from: data)
                                    m{
                                        completion(.failure(object),statusCode)
                                    }
                                }catch{
                                    print(error)
                                    let error = ResponseError.init(msg: "Ups, un error ha ocurrido, comprueba tu conexion a internet e intentalo nuevamente")
                                    m{
                                        completion(.failure(error),statusCode)
                                    }
                                }
                            }else{
                                let error = ResponseError.init(msg: "Ups, un error ha ocurrido, comprueba tu conexion a internet e intentalo nuevamente")
                                m{
                                    completion(.failure(error),statusCode)
                                }
                            }
                            break
                        }
                        
                    }
                case .failure(let error):
                    print("Error in upload: \(error.localizedDescription)")
                    let error = ResponseError.init(msg: error.localizedDescription)
                    m{
                        completion(.failure(error),0)
                    }
                }
            }
            
            return nil
        }
    
        return Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                printResponse(response: response)
                
                guard let statusCode =  response.response?.statusCode else {
                    let error = ResponseError.init(msg: "Ups, un error ha ocurrido")
                    m{
                        completion(.failure(error),0)
                    }
                    return
                }
                
                /*if statusCode == 403 && auth{
                    m{
                        utils.expiredToken()
                    }
                    return
                }*/
                
                switch response.result {
                case .success:
                    
                    if let data = response.data {
                        let decoder = JSONDecoder()
                        decoder.dateDecodingStrategy = .formatted(serverDateFormatter)
                        do{
                            
                            let object = try decoder.decode(T.self, from: data)
                            m{
                                completion(.success(object),statusCode)
                            }
                        }catch{
                            print(error)
                            do{
                                let object = try decoder.decode(ResponseError.self, from: data)
                                m{
                                    completion(.failure(object),statusCode)
                                }
                            }catch{
                                print(error)
                                let error = ResponseError.init(msg: "Ups, un error ha ocurrido")
                                m{
                                    completion(.failure(error),statusCode)
                                }
                            }
                        }
                    }
                    break
                case .failure(let error):
                    print("\nError: \n\n" + error.localizedDescription)
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(serverDateFormatter)
                    if let data = response.data{
                        do{
                            let object = try decoder.decode(ResponseError.self, from: data)
                            m{
                                completion(.failure(object),statusCode)
                            }
                        }catch{
                            print(error)
                            let error = ResponseError.init(msg: "Ups, un error ha ocurrido, comprueba tu conexion a internet e intentalo nuevamente")
                            m{
                                completion(.failure(error),statusCode)
                            }
                        }
                    }else{
                        let error = ResponseError.init(msg: "Ups, un error ha ocurrido, comprueba tu conexion a internet e intentalo nuevamente")
                        m{
                            completion(.failure(error),statusCode)
                        }
                    }
                    break
                }
        }
        
    }
    
    
}
