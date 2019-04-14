//
//  FilterPriceView.swift
//  Search Filter
//
//  Created by James Sraun on 11/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import UIKit

enum Direction {
    case left
    case right
}

class FilterPriceView: UIView {
    
    var titleText: String? {
        didSet {
            titleLabel.text = self.titleText
        }
    }
    
    var priceText: String? {
        didSet {
            priceLabel.text = self.priceText
        }
    }
    
    var position: Direction {
        didSet {
            switch self.position {
            case .left:
                self.setupLeftViewsConstraints()
            case .right:
                self.setupRightViewsConstraints()
            }
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Title"
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Rp 0"
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 18)
        
        return label
    }()
    
    private let border: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.mainGray
        
        return view
    }()
    
    override init(frame: CGRect) {
        self.position = .left
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(border)
    }
    
    let filterPriceViewWidth = (UIScreen.main.bounds.width / 2) - 32
    
    private func setupLeftViewsConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview()
        }
        
        border.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.width.equalTo(filterPriceViewWidth)
            make.height.equalTo(1)
        }
    }
    
    private func setupRightViewsConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.right.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.right.equalToSuperview()
        }
        
        border.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.width.equalTo(filterPriceViewWidth)
            make.height.equalTo(1)
        }
    }
    
}
