//
//  Filter.swift
//  Search Filter
//
//  Created by James Sraun on 14/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import Foundation

class Filter {
    
    static let minimumValue = 100.0
    static let maximumValue = 10000000.0
    
    var minimumPrice: Double
    var maximumPrice: Double
    var isWholeSale: Bool = false
    var isOfficial: Bool = true
    var fShop: String
    
    init(minimumPrice: Double = Filter.minimumValue, maximumPrice: Double = Filter.maximumValue, isWholeSale: Bool = false, isOfficial: Bool = true, fShop: String = "2") {
        self.minimumPrice = minimumPrice
        self.maximumPrice = maximumPrice
        self.isWholeSale = isWholeSale
        self.isOfficial = isOfficial
        self.fShop = fShop
    }
    
    func reset() {
        self.minimumPrice = Filter.minimumValue
        self.maximumPrice = Filter.maximumValue
        self.isWholeSale = false
        self.isOfficial = false
        self.fShop = "2"
    }
}
