//
//  MyButton.swift
//  Search Filter
//
//  Created by James Sraun on 11/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import UIKit

class MyButton: UIButton {
    
    var titleText: String? {
        didSet {
            self.setTitle(titleText, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        self.clipsToBounds = true
        backgroundColor = UIColor.mainGreen
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    }
}
