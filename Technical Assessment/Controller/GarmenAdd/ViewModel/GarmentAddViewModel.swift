//
//  GarmentAddViewModel.swift
//  Technical Assessment
//
//  Created by TAHA SALLAM on 12/20/20.
//

import Foundation

public class GarmentAddViewModel{
   public init() {
        
    }
    public  func addGament(name:String,Date:Date){
          DispatchQueue.global(qos: .userInteractive).sync { [unowned self]  in
            GamenList.add(name: name, Date: Date)
       }
    }
}

