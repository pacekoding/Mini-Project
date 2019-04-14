//
//  ShopTypeView.swift
//  Search Filter
//
//  Created by James Sraun on 13/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import UIKit

class ShopTypeView: UIView {
    
    static let buttonHeight: CGFloat = 51
    
    let myNavbar = MyNavbar()
    
    let applyButton: MyButton = {
        let button = MyButton(type: .system)
        button.titleText = "Apply"
        
        return button
    }()
    
    let tableview: UITableView = {
        let view = UITableView(frame: CGRect.zero, style: .plain)
        view.allowsMultipleSelection = true
        view.allowsMultipleSelectionDuringEditing = true
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.mainGray
        addSubviews()
        setupViewsConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(myNavbar)
        addSubview(tableview)
        addSubview(applyButton)
    }
    
    private func setupViewsConstraints() {
        myNavbar.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(MyNavbar.height)
        }
        
        tableview.snp.makeConstraints { (make) in
            make.top.equalTo(myNavbar.snp.bottom).offset(1)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(applyButton.snp.top)
        }
        
        applyButton.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(ShopTypeView.buttonHeight)
        }
    }
}
