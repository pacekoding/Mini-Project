//
//  LoadingView.swift
//  Search Filter
//
//  Created by James Sraun on 14/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import UIKit

class LoadingView: UICollectionViewCell {
    
    static let identifier = "loadingViewIdentifier"
    
    let spinnerView: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        activityView.startAnimating()
        return activityView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView() {
        backgroundColor = UIColor(white: 1, alpha: 1)
        addSubview(spinnerView)
        
        spinnerView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
