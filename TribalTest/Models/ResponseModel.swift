import Foundation

class MessageModel: Codable {
    var message: String
}

class ResponseModel<T: Codable>: Codable {
    var data: T
    var error: String?
}

class ResponseModel2<T: Codable>: Codable {
    var data: T
    var message: String?
}

class ResponseError: Codable {
    var error: String
    
    init(msg:String) {
        error = msg
    }
}

