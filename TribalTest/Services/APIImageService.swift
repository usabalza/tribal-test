//
//  APIImageService.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation

class APIImageService: ImageService{
    func getAll(page: Int, completion: @escaping (ServiceResponseStatus<[WelcomeElement]>) -> ()) {
        let url = "photos"
        APIService.request(endpoint: url, responseType: [WelcomeElement].self) { (response, statusCode) in
            switch response{
            case let .success(model):
                completion(.success(model))
            case let .failure(error):
                completion(.failure(error.error))
            }
        }
    }
    
    
}
