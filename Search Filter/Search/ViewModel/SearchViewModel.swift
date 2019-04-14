//
//  SearchViewModel.swift
//  Search Filter
//
//  Created by James Sraun on 14/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import UIKit

class SearchViewModel: NSObject {
    
    let baseUrl = "https://ace.tokopedia.com/search/v2.5/product"
    
    weak var delegate: SearchViewModelDelegate?
    
    var products = [Product]()
    
    var startIndex = 0
    var numberOfRows = 10
    var isFetchingMore = false
    var isLoading = false
    
    let filter = Filter()
    
    fileprivate func setUrl() -> URL {
        var queryItems = [NSURLQueryItem]()
        queryItems.append(NSURLQueryItem(name: "q", value: "samsung"))
        queryItems.append(NSURLQueryItem(name: "pmin", value: String(filter.minimumPrice)))
        queryItems.append(NSURLQueryItem(name: "pmax", value: String(filter.maximumPrice)))
        queryItems.append(NSURLQueryItem(name: "wholesale", value: String(filter.isWholeSale)))
        queryItems.append(NSURLQueryItem(name: "official", value: String(filter.isOfficial)))
        queryItems.append(NSURLQueryItem(name: "fshop", value: String(2)))
        queryItems.append(NSURLQueryItem(name: "start", value: String(startIndex)))
        queryItems.append(NSURLQueryItem(name: "rows", value: String(numberOfRows)))
        
        let urlComps = NSURLComponents(string: baseUrl)!
        urlComps.queryItems = queryItems as [URLQueryItem]
        
        return urlComps.url!
    }
    
    fileprivate func fetchProducts(completion: @escaping (Result<[Product],Error>) -> Void) {
        let url = setUrl()
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let productResponse = try JSONDecoder().decode(ProductResponse.self, from: data!)
                completion(.success(productResponse.data))
            } catch let jsonError {
                completion(.failure(jsonError))
            }
        }.resume()
    }
    
    fileprivate func handleWhenSuccess(newProducts: [Product]) {
        
        if isFetchingMore {
            products += newProducts
        } else {
            products = newProducts
        }
        
        startIndex += numberOfRows
        delegate?.viewModelDidFetch()
    }
    
    fileprivate func handleCallback() {
        fetchProducts { [weak self] (result) in
            switch result {
            case .success(let products):
                self?.handleWhenSuccess(newProducts: products)
            case .failure(let error):
                print(error)
            }
        }
    }
}

//public methods
extension SearchViewModel {
    public func fetch() {
        handleCallback()
    }
    
    @objc public func refresh() {
        startIndex = 0
        handleCallback()
    }
}
