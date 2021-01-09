//
//  GarmentListDataSourceTests.swift
//  Technical AssessmentTests
//
//  Created by TAHA SALLAM on 12/21/20.
//

import XCTest
import Technical_Assessment
import UIKit

class GarmentListDataSourceTests: XCTestCase {

    var tableView:UITableView?
    
    var garmentListViewModel:GarmentListViewModel?
    var garmentListDataSource:GarmentListDataSource?
    
    
    override func setUpWithError() throws {
        
        garmentListDataSource = GarmentListDataSource()
        garmentListViewModel = {
            return  GarmentListViewModel(garmentList: garmentListDataSource)
        }()
        
        tableView = UITableView()
        
    }

    override func tearDownWithError() throws {
       
        garmentListViewModel = nil
        garmentListDataSource = nil
        tableView = nil
        
    }

    func testTableView() throws {
        
        GamenList.deleteAllData()
        GamenList.add(name: "bb", Date: Date())
        GamenList.add(name: "aa", Date: Date())
        GamenList.add(name: "cc", Date: Date())
       
        tableView?.register(UITableViewCell.self,forCellReuseIdentifier: "Cell")
        
        tableView?.dataSource = garmentListDataSource
        tableView?.delegate = garmentListDataSource
        garmentListViewModel?.fetch(sortType: .ByDate)
        
        XCTAssertNotNil(tableView)
        XCTAssertNotNil(garmentListDataSource)
        XCTAssertNotNil(garmentListViewModel)
        
        XCTAssertTrue(garmentListDataSource!.tableView(tableView!, numberOfRowsInSection: 0) == 3)
               
       
        XCTAssertTrue( garmentListDataSource!.numberOfSections(in: tableView!) == 1)
               
            
        
    }
    
}
