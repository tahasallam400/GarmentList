//
//  GarmentAddViewModelTests.swift
//  Technical AssessmentTests
//
//  Created by TAHA SALLAM on 12/21/20.
//

import XCTest
import Technical_Assessment

class GarmentAddViewModelTests: XCTestCase {
    
    var garmentAddViewModel:GarmentAddViewModel?
    

    override func setUpWithError() throws {
        garmentAddViewModel = GarmentAddViewModel()
    }

    override func tearDownWithError() throws {
        garmentAddViewModel = nil
        GamenList.deleteAllData()
    }
    
    func testAddGarment(){
        
        GamenList.deleteAllData()
        let dateTime = Date()
       
        
        garmentAddViewModel?.addGament(name: "First Value", Date: dateTime)
        let list = GamenList.list()
        XCTAssertNotNil(list)
        XCTAssertNotNil(list?.last)
        XCTAssertNotNil(list!.last?.name)
        XCTAssertNotNil(list!.last?.creationDate )
        XCTAssertTrue(list!.last!.name == "First Value")
        XCTAssertTrue(list!.last!.creationDate == dateTime)
        XCTAssertTrue(list!.count == 1)
        //check if name exist before it will not add
        garmentAddViewModel?.addGament(name: "First Value", Date: dateTime)
        let list2 = GamenList.list()
        XCTAssertNotNil(list2)
        XCTAssertTrue(list2!.count == 1)
    }


}
