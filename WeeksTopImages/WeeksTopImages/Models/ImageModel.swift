//
//  ImageModel.swift
//  WeeksTopImages
//
//  Created by shiva kumar on 5/1/24.
//

import Foundation

struct ImageModel: Decodable {
    let id: String
    let title: String
    let datetime: TimeInterval
    let images: [ImageDetail]?
}

struct ImageDetail: Decodable {
    let link: URL
}

struct ImageSearchResponse: Decodable {
    let data: [ImageModel]
}
