//
//  SearchViewController+DataSource.swift
//  Search Filter
//
//  Created by James Sraun on 11/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import UIKit
import Kingfisher

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier , for: indexPath) as? SearchCollectionViewCell else {
            fatalError()
        }
        
        let product = self.viewModel.products[indexPath.item]

        
        cell.imageURI = product.imageUri
        cell.nameLabel.text = product.name
        cell.priceLabel.text = product.price
        
        return cell
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let isProductSection = section == 0
        let isFetchingMore = self.viewModel.isFetchingMore
        
        if isProductSection {
            return self.viewModel.products.count
        }
        
        if isFetchingMore {
            return 1
        }
        
        return 0
    }
}
