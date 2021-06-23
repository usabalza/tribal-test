//
//  ImageService.swift
//  TribalTest
//
//  Created by wams macbook ios on 6/22/21.
//  Copyright © 2021 wams macbook ios. All rights reserved.
//

import Foundation

protocol ImageService{
    func getAll(page: Int, completion: @escaping (ServiceResponseStatus<[WelcomeElement]>) -> ())
}
