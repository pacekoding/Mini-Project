//
//  FilterFirstSectionView.swift
//  Search Filter
//
//  Created by James Sraun on 11/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import UIKit

class FilterFirstSectionView: UIView {
    
    static let height: CGFloat = 182.5
    
    let leftFilterPriceView : FilterPriceView = {
        let view = FilterPriceView()
        view.position = .left
        view.titleText = "Minimum Price"
        
        return view
    }()
    
    let rightFilterPriceView : FilterPriceView = {
        let view = FilterPriceView()
        view.position = .right
        view.titleText = "Minimum Price"
        
        return view
    }()
    
    let rangeSlider = RangeSlider()
    
    
    private let wholeSaleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Whole Sale"
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        
        return label
    }()
    
    let wholeSaleSwitch = UISwitch()
    
    var filterPriceStackView: UIStackView!
    var wholeSaleStackView: UIStackView!
    
    override init(frame: CGRect) {
        
        wholeSaleStackView = UIStackView(arrangedSubviews: [wholeSaleLabel, wholeSaleSwitch])
        wholeSaleStackView?.axis = .horizontal
        wholeSaleStackView?.distribution = .equalSpacing
        
        filterPriceStackView = UIStackView(arrangedSubviews: [leftFilterPriceView,rightFilterPriceView])
        filterPriceStackView?.axis = .horizontal
        filterPriceStackView?.distribution = .equalSpacing
        filterPriceStackView?.spacing = 32
        
        super.init(frame: frame)
        backgroundColor = .white
        addSubviews()
        setupViewsConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(filterPriceStackView)
        addSubview(rangeSlider)
        addSubview(wholeSaleStackView)
    }
    
    private func setupViewsConstraints() {
        
        filterPriceStackView?.snp.makeConstraints({ (make) in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.height.equalTo(56.5)
        })
        
        rangeSlider.snp.makeConstraints { (make) in
            make.top.equalTo(filterPriceStackView.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.height.equalTo(31.0)
        }
        
        wholeSaleStackView.snp.makeConstraints { (make) in
            make.top.equalTo(rangeSlider.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
        }
        
    }
    
}

