//
//  SearchViewController.swift
//  Search Filter
//
//  Created by James Sraun on 10/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    let viewModel: SearchViewModel
    
    init(_ viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = SearchView(frame: CGRect.zero)
        
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
        view.collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        view.collectionView.register(LoadingView.self, forCellWithReuseIdentifier: LoadingView.identifier)
        view.collectionView.refreshControl?.addTarget(viewModel, action: #selector(viewModel.refresh), for: .valueChanged)
        view.filterButton.addTarget(self, action: #selector(didTapFilterButton), for: .touchUpInside)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        viewModel.fetch()
    }
    
    @objc private func didTapFilterButton() {
        let filterViewController = FilterViewController(viewModel)
        let navigationController = UINavigationController(rootViewController: filterViewController)
        navigationController.setNavigationBarHidden(true, animated: false)
        
        self.present(navigationController, animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let isFetchingMore = viewModel.isFetchingMore
        
        if offsetY > contentHeight - scrollView.frame.height {
            if !isFetchingMore {
                self.viewModel.isFetchingMore = true
                self.viewModel.fetch()
            }
        }
    }
    
}
