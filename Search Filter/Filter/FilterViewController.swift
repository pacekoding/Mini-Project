//
//  FilterViewController.swift
//  Search Filter
//
//  Created by James Sraun on 11/04/19.
//  Copyright © 2019 PT.Qlue Performa Indonesia. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    
    let viewModel: SearchViewModel
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    init(_ viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = FilterView(frame: .zero)
        
        view.myNavbar.titleText = "Filter"
        view.myNavbar.cancelButton.addTarget(self, action: #selector(didTapCancelButton), for: .touchUpInside)
        view.myNavbar.resetButton.addTarget(self, action: #selector(didTapResetButton), for: .touchUpInside)
        
        view.applyButton.addTarget(self, action: #selector(didTapApplyButton), for: .touchUpInside)
        
        view.filterFirstSectionView.rangeSlider.addTarget(self, action: #selector(rangeSliderValueChanged), for: .valueChanged)
        view.filterFirstSectionView.wholeSaleSwitch.addTarget(self, action: #selector(didTapWholeSaleSwitch), for: .valueChanged)
        
        view.filterSecondSectionView.arrowButton.addTarget(self, action: #selector(didTapArrowButton), for: .touchUpInside)
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFilterViewValue()
    }
    
    private func setupFilterViewValue() {
        guard let view = self.view as? FilterView else {
            return
        }
        
        view.minimumValue = Filter.minimumValue
        view.maximumValue = Filter.maximumValue
        view.lowerValue = viewModel.filter.minimumPrice
        view.upperValue = viewModel.filter.maximumPrice
        view.isWholeSale = viewModel.filter.isWholeSale
    }
    
    @objc private func didTapCancelButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapResetButton() {
        viewModel.filter.reset()
        setupFilterViewValue()
    }
    
    @objc private func didTapApplyButton() {
        viewModel.fetch()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapArrowButton() {
        let viewController = ShopTypeViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func rangeSliderValueChanged(rangeSlider: RangeSlider) {
        guard let view = self.view as? FilterView else {
            return
        }
        
        view.lowerValue = rangeSlider.lowerValue
        view.upperValue = rangeSlider.upperValue
        viewModel.filter.minimumPrice = rangeSlider.lowerValue
        viewModel.filter.maximumPrice = rangeSlider.upperValue
    }
    
    @objc func didTapWholeSaleSwitch(wholeSaleSwitch: UISwitch) {
        viewModel.filter.isWholeSale = wholeSaleSwitch.isOn
    }
}
