//
//  MyNavbar.swift
//  Search Filter
//
//  Created by James Sraun on 11/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import UIKit
import SnapKit

class MyNavbar: UIView {
    
    static let height: CGFloat = 58
    
    var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "cancel")?.withRenderingMode(.alwaysTemplate)
       
        button.setImage(image, for: .normal)
        button.tintColor = UIColor.darkGray
        
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Title"
        label.textColor = UIColor.darkGray
        label.font = UIFont.boldSystemFont(ofSize: 18)
        
        return label
    }()
    
    let resetButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(UIColor.mainGreen, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        addSubviews()
        setupViewsConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addSubviews() {
        addSubview(cancelButton)
        addSubview(titleLabel)
        addSubview(resetButton)
    }
    
    private func setupViewsConstraints() {
        cancelButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(18)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(cancelButton.snp.right).offset(20)
            make.centerY.equalToSuperview()
        }
        
        resetButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
    }
    
}
