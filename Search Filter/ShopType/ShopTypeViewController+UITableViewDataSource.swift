//
//  ShopTypeViewController+UITableViewDataSource.swift
//  Search Filter
//
//  Created by James Sraun on 13/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import UIKit

extension ShopTypeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ShopTypeViewCell.identifier) as! ShopTypeViewCell
        
        if indexPath.item == 0 {
             cell.textLabel?.text = "Gold Merchant"
        } else {
            cell.textLabel?.text = "Official Store"
        }
        
        return cell
    }
    
    
}
