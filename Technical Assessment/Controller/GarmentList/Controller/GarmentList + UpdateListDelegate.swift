//
//  GarmentList + UpdateListDelegate.swift
//  Technical Assessment
//
//  Created by TAHA SALLAM on 12/21/20.
//

import Foundation

extension GarmentListViewController:UpdateGarmentListDelegate{
    func update() {
        self.garmentListViewModel.fetch(sortType: SortOption(rawValue: sortBtnOption.selectedSegmentIndex)!)
    }
}
