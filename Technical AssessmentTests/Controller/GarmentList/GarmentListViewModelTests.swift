//
//  GarmentListViewModelTests.swift
//  Technical AssessmentTests
//
//  Created by TAHA SALLAM on 12/21/20.
//

import XCTest
import Technical_Assessment

class GarmentListViewModelTests: XCTestCase {

    var garmentListViewModel:GarmentListViewModel?
    
    var garmentListDataSource:GarmentListDataSource?
    
   
    
    
    override func setUpWithError() throws {
        garmentListDataSource = GarmentListDataSource()
        
        garmentListViewModel = {
            return  GarmentListViewModel(garmentList: garmentListDataSource)
        }()
        
    }

    override func tearDownWithError() throws {
        garmentListViewModel = nil
        garmentListDataSource = nil
        GamenList.deleteAllData()
    }

    func testFetch() throws {
        
        XCTAssertNotNil(garmentListViewModel)
        
        GamenList.deleteAllData()
        
        let date1 = Date().addingTimeInterval(86400)
        let date2 = Date().addingTimeInterval(86411)
        let date3 = Date().addingTimeInterval(86422)
        
        GamenList.add(name: "cc", Date: date3)
        GamenList.add(name: "bb", Date: date1)
        GamenList.add(name: "aa", Date: date2)
      
      
        
        garmentListViewModel?.fetch(sortType: .ByDate)
       
        XCTAssertNotNil( garmentListViewModel?.garmentList)
        XCTAssertNotNil(garmentListViewModel?.garmentList?.data)
        XCTAssertNotNil(garmentListViewModel?.garmentList?.data.value)
        XCTAssertTrue(garmentListViewModel!.garmentList!.data.value.count == 3)
        XCTAssertTrue(garmentListViewModel!.garmentList!.data.value[0].creationDate == date1)
        XCTAssertTrue(garmentListViewModel!.garmentList!.data.value[1].creationDate == date2)
        XCTAssertTrue(garmentListViewModel!.garmentList!.data.value[2].creationDate == date3)
        
        
        
        
       garmentListViewModel?.fetch(sortType: .ByalphAbetical)
        
        XCTAssertNotNil( garmentListViewModel?.garmentList)
        XCTAssertNotNil(garmentListViewModel?.garmentList?.data)
        XCTAssertNotNil(garmentListViewModel?.garmentList?.data.value)
        XCTAssertTrue(garmentListViewModel!.garmentList!.data.value.count == 3)
        
        XCTAssertTrue(garmentListViewModel!.garmentList!.data.value[0].name == "aa")
        XCTAssertTrue(garmentListViewModel!.garmentList!.data.value[1].name == "bb")
        XCTAssertTrue(garmentListViewModel!.garmentList!.data.value[2].name == "cc")
    }

    

}
