//
//  SplashViewController.swift
//  Search Filter
//
//  Created by James Sraun on 10/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import UIKit
import SnapKit

class SplashViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let image = UIImage(named: "tokopedia")
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.presentMainScreen()
//        }
    }
    
    private func setupLayout() {
        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(128)
            make.width.equalTo(240)
        }
    }
    
    private func presentMainScreen() {
        let viewController = SearchViewController()
        viewController.title = "Search"
        let rootViewController = UINavigationController(rootViewController: viewController)
        
        self.present(rootViewController, animated: false, completion: nil)
    }
}
