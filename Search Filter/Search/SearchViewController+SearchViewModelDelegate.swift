//
//  SearchViewController+SearchViewModelDelegate.swift
//  Search Filter
//
//  Created by James Sraun on 14/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import Foundation


extension SearchViewController: SearchViewModelDelegate {
    func viewModelDidFetch() {
        
        guard let view = self.view as? SearchView else {
            return
        }
        
        self.viewModel.isFetchingMore = false
        
        DispatchQueue.main.async {
            view.collectionView.refreshControl?.endRefreshing()
            view.collectionView.reloadData()
        }
    }    
}
