//
//  SearchViewController+UICollectionVideDelegateFlowLayout.swift
//  Search Filter
//
//  Created by James Sraun on 11/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import UIKit

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = collectionView.bounds.size.width
        let isFetchingMore = self.viewModel.isFetchingMore
        
        if isFetchingMore {
            return CGSize(width: collectionViewWidth, height: 51)
        }
        
        let itemPerLine = CGFloat(SearchView.collectionViewItemsPerLine)
        let interItemSpacing = CGFloat(SearchView.collectionViewInterItemSpacing)
        
        let itemWidth = (collectionViewWidth - interItemSpacing) / itemPerLine
        let itemHeight = CGFloat(260)
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}
