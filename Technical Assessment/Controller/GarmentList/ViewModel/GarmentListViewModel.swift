//
//  GarmentListViewModel.swift
//  Technical Assessment
//
//  Created by TAHA SALLAM on 12/20/20.
//

import Foundation

public class GarmentListViewModel{
    
   public weak var garmentList : GenericDataSource<GamenList>?
    
   public init(garmentList : GenericDataSource<GamenList>?) {
        self.garmentList = garmentList
   }
    
   public func fetch(sortType:SortOption){
        DispatchQueue.global(qos: .userInteractive).sync { [weak self] in
            guard let self = self else {
            return
          }
            switch sortType {
            case .ByDate:
                self.garmentList?.data.value = GamenList.sortedByDate() ?? []
                break
            case .ByalphAbetical:
                self.garmentList?.data.value = GamenList.sortedByalphabetical() ?? []
                break
            }
        }
    }
}

