//
//  FilterSecondSectionView.swift
//  Search Filter
//
//  Created by James Sraun on 12/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import UIKit

class FilterSecondSectionView: UIView {
    
    static let height: CGFloat = 123
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Shop Type"
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        
        return label
    }()
    
    let arrowButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "right-arrow")?.withRenderingMode(.alwaysTemplate)
        
        button.imageEdgeInsets = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        button.setImage(image, for: .normal)
        button.tintColor = UIColor.mainGreen
        
        return button
    }()
    
    var titleStackView: UIStackView!
    
    let goldMerchantTypeView: FilterTypeView = {
        let view = FilterTypeView()
        
        view.titleText = "Gold Merchant"
        view.layer.borderColor = UIColor.mainGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 44/2
        
        return view
    }()
    
    let officialStoreTypeView: FilterTypeView = {
        let view = FilterTypeView()
        
        view.titleText = "Official Store"
        view.layer.borderColor = UIColor.mainGray.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 44/2
        
        return view
    }()
    
    override init(frame: CGRect) {
        
        titleStackView = UIStackView(arrangedSubviews: [titleLabel, arrowButton])
        titleStackView.axis = .horizontal
        titleStackView.distribution = .equalSpacing
        
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        setupViewsConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(titleStackView)
        addSubview(goldMerchantTypeView)
        addSubview(officialStoreTypeView)
    }
    
    private func setupViewsConstraints() {
        titleStackView.snp.makeConstraints({ (make) in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.height.equalTo(31)
        })
        
        arrowButton.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(31)
        }
        
        goldMerchantTypeView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(titleStackView.snp.bottom).offset(16)
            make.height.equalTo(44)
            make.width.equalTo(160)
        }
        
        officialStoreTypeView.snp.makeConstraints { (make) in
            make.left.equalTo(goldMerchantTypeView.snp.right).offset(16)
            make.top.equalTo(titleStackView.snp.bottom).offset(16)
            make.height.equalTo(44)
            make.width.equalTo(160)
        }
    }
    
}
