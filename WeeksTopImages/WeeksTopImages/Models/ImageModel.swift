//
//  ImageModel.swift
//  WeeksTopImages
//
//  Created by shiva kumar on 5/1/24.
//

import Foundation

struct ImageModel: Decodable {
    let title: String
    let datetime: TimeInterval
    let images: [Image]?
}

struct Image: Decodable {
    let link: URL
}

struct ImageSearchResponse: Decodable {
    let data: [ImageModel]
}
