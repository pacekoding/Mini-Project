//
//  ShopTypeViewController.swift
//  Search Filter
//
//  Created by James Sraun on 13/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import UIKit

class ShopTypeViewController: UIViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func loadView() {
        let view = ShopTypeView(frame: .zero)
        
        view.myNavbar.titleText = "Shop Type"
        view.myNavbar.cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        view.myNavbar.resetButton.addTarget(self, action: #selector(didTapResetButton), for: .touchUpInside)
        view.tableview.register(ShopTypeViewCell.self, forCellReuseIdentifier: ShopTypeViewCell.identifier)
        view.tableview.dataSource = self
        
        self.view = view
    }
    
    @objc private func didTapCancelButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func didTapResetButton() {
        
    }
    
}
