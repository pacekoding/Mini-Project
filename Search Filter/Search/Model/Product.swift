//
//  Product.swift
//  Search Filter
//
//  Created by James Sraun on 14/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import Foundation

struct Product: Decodable {
    let id: Int
    let name: String
    let imageUri: String
    let price: String

    enum CodingKeys: String, CodingKey {
        case imageUri = "image_uri", id, name, price
    }
}

struct ProductResponse: Decodable {
    let data: [Product]
}
