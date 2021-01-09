//
//  GenericDataSource.swift
//  Technical Assessment
//
//  Created by TAHA SALLAM on 12/20/20.
//


import Foundation
public class GenericDataSource<T> : NSObject {
  public  var data: DynamicValue<[T]> = DynamicValue([])
}
