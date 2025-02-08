//
//  CatImages.swift
//  API and Json Data
//
//  Created by Chaitanya Soni on 08/02/25.
//
import Foundation

struct CatImageElement: Codable {
    let _id: String
    let _url: String
    let _width, _height: Int
    
    enum CodingKeys: String, CodingKey {
        case _id = "id"
        case _url = "url"
        case _width = "width"
        case _height = "height"
    }
}

typealias CatImages = [CatImageElement]
