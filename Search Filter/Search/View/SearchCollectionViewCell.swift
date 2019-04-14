//
//  File.swift
//  Search Filter
//
//  Created by James Sraun on 11/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import UIKit
import Kingfisher

class SearchCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "SearchCollectionViewCellIdentifier"
    
    var imageURI: String! {
        didSet {
            let url = URL(string: imageURI)
            itemImageView.kf.indicatorType = .activity
            itemImageView.kf.setImage(with: url, options: [.transition(.fade(0.2))])
        }
    }
    
    var itemImageView: ImageView = {
        let imageView = ImageView()
        
        imageView.backgroundColor = UIColor.lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 2
        imageView.layer.masksToBounds = true
        
        return imageView
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.textColor = UIColor.darkGray
        label.numberOfLines = 2
        label.sizeToFit()
        
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.mainOrange
        label.numberOfLines = 2
        label.sizeToFit()
        
        return label
    }()
    
    override var alignmentRectInsets: UIEdgeInsets {
        let cellPadding = SearchView.collectionViewCellPadding
        return UIEdgeInsets(top: cellPadding, left: cellPadding, bottom: cellPadding, right: cellPadding)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        addSubviews()
        setupViewsConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(itemImageView)
        addSubview(nameLabel)
        addSubview(priceLabel)
    }
    
    private func setupViewsConstraints() {
        
        let cellPadding = SearchView.collectionViewCellPadding
        let itemImageViewWidth = self.frame.width - (cellPadding * 2)
        
        itemImageView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.width.equalTo(itemImageViewWidth)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(itemImageView.snp.bottom).offset(cellPadding)
            make.leading.trailing.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(cellPadding)
            make.leading.trailing.equalToSuperview()
        }
        
    }
}
