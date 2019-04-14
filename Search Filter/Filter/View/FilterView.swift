//
//  FilterView.swift
//  Search Filter
//
//  Created by James Sraun on 11/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import UIKit
import SnapKit

class FilterView: UIView {
    
    static let padding: CGFloat = 16
    static let buttonHeight: CGFloat = 51
    
    var minimumValue = 100.0 {
        didSet {
            filterFirstSectionView.rangeSlider.minimumValue = self.minimumValue
        }
    }
    
    var maximumValue = 1000000.0 {
        didSet {
            filterFirstSectionView.rangeSlider.maximumValue = self.maximumValue
            
        }
    }
    
    var lowerValue = 100.0 {
        didSet {
            filterFirstSectionView.rangeSlider.lowerValue = self.lowerValue
            filterFirstSectionView.leftFilterPriceView.priceText = lowerValue.formattedAsRupiah
        }
    }
    
    var upperValue = 1000000.0 {
        didSet {
            filterFirstSectionView.rangeSlider.upperValue = self.upperValue
            filterFirstSectionView.rightFilterPriceView.priceText = upperValue.formattedAsRupiah
        }
    }
    
    var isWholeSale = false {
        didSet {
            filterFirstSectionView.wholeSaleSwitch.isOn = self.isWholeSale
        }
    }
    
    let myNavbar = MyNavbar()
    
    let filterFirstSectionView = FilterFirstSectionView()
    let filterSecondSectionView = FilterSecondSectionView()
    
    let applyButton: MyButton = {
        let button = MyButton(type: .system)
        button.titleText = "Apply"
        
        return button
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
        addSubview(filterFirstSectionView)
        addSubview(filterSecondSectionView)
        addSubview(applyButton)
    }
    
    private func setupViewsConstraints() {
        myNavbar.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(MyNavbar.height)
        }
        
        filterFirstSectionView.snp.makeConstraints { (make) in
            make.top.equalTo(myNavbar.snp.bottom).offset(FilterView.padding)
            make.left.right.equalToSuperview()
            make.height.equalTo(FilterFirstSectionView.height)
        }
        
        filterSecondSectionView.snp.makeConstraints { (make) in
            make.top.equalTo(filterFirstSectionView.snp.bottom).offset(FilterView.padding)
            make.left.right.equalToSuperview()
            make.height.equalTo(FilterSecondSectionView.height)
        }
        
        applyButton.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(FilterView.buttonHeight)
        }
    }
}
