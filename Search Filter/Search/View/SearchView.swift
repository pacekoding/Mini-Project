//
//  SearchView.swift
//  Search Filter
//
//  Created by James Sraun on 10/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import UIKit
import SnapKit

class SearchView: UIView {
    static let collectionViewItemsPerLine = 2
    static let collectionViewInterItemSpacing: CGFloat = 2.0
    static let collectionViewSectionInsetPadding: CGFloat = 8.0
    static let collectionViewCellPadding: CGFloat = 8.0
    static let buttonHeight: CGFloat = 51
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let interItemSpacing = SearchView.collectionViewInterItemSpacing
        let sectionPadding = SearchView.collectionViewSectionInsetPadding
        
        layout.minimumLineSpacing = CGFloat(interItemSpacing)
        layout.minimumInteritemSpacing = CGFloat(interItemSpacing)
        layout.sectionInset = UIEdgeInsets(top: sectionPadding, left: 0, bottom: sectionPadding, right: 0)
        
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.backgroundColor = UIColor.clear
        view.refreshControl = UIRefreshControl()
        
        return view
    }()
    
    let filterButton: MyButton = {
        let button = MyButton(type: .system)
        button.titleText = "Filter"
        
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
        addSubview(collectionView)
        addSubview(filterButton)
    }
    
    private func setupViewsConstraints() {
        collectionView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-SearchView.buttonHeight)
        }
        
        filterButton.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(SearchView.buttonHeight)
        }
    }
    
}
