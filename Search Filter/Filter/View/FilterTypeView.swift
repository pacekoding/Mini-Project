//
//  FilterTypeView.swift
//  Search Filter
//
//  Created by James Sraun on 13/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import UIKit

class FilterTypeView: UIView {
    
    var titleText: String? {
        didSet {
            titleLabel.text = self.titleText
        }
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Title"
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 13)
        
        return label
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "cancel")?.withRenderingMode(.alwaysTemplate)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
        button.setImage(image, for: .normal)
        button.tintColor = UIColor.lightGray
        button.backgroundColor = UIColor.mainGray.withAlphaComponent(0.8)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.mainGray.cgColor
        button.layer.cornerRadius = 44/2
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupViewsConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(cancelButton)
    }
    
    private func setupViewsConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(16)
            make.centerY.equalToSuperview()
        }
        
        cancelButton.snp.makeConstraints { (make) in
            make.top.right.bottom.equalToSuperview()
            make.height.width.equalTo(44)
        }
        
    }
    
}
