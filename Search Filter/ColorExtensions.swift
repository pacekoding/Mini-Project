//
//  ColorExtensions.swift
//  Search Filter
//
//  Created by James Sraun on 11/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import UIKit

extension UIColor {
    static var mainGray = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
    static var mainGreen = UIColor(red: 66/255, green: 180/255, blue: 73/255, alpha: 1)
    static var mainOrange = UIColor(red: 255/255, green: 99/255, blue: 71/255, alpha: 1)
}

extension Double {
    var formattedAsRupiah: String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.groupingSize = 3
        formatter.usesGroupingSeparator = true
        
        return "Rp " + formatter.string(from: NSNumber(value: self))!
    }
}
