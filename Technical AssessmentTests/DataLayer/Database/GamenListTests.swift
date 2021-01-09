//
//  GamenListTests.swift
//  Technical AssessmentTests
//
//  Created by TAHA SALLAM on 12/21/20.
//

import XCTest
import Technical_Assessment
import CoreData
class GamenListTests: XCTestCase {


    func testDeleteAllData(){
        GamenList.add(name:"First Value", Date: Date())
        GamenList.add(name: "Second Value", Date: Date())
        GamenList.deleteAllData()
       let gamentList = GamenList.list()
        XCTAssertTrue(((gamentList?.count) != nil))
        XCTAssertTrue(gamentList?.count ?? 0 == 0)
    }
    
    
    
    func testAdd()  {
      
        GamenList.deleteAllData()
        let dateTime = Date()
        GamenList.add(name: "First Value",Date:dateTime)
        let list = GamenList.list()
        XCTAssertNotNil(list)
        XCTAssertNotNil(list?.last)
        XCTAssertNotNil(list!.last?.name)
        XCTAssertNotNil(list!.last?.creationDate )
        XCTAssertTrue(list!.last!.name == "First Value")
        XCTAssertTrue(list!.last!.creationDate == dateTime)
        XCTAssertTrue(list!.count == 1)
        //check if name exist before it will not add
         GamenList.add(name: "First Value",Date:Date())
        let list2 = GamenList.list()
        XCTAssertNotNil(list2)
        XCTAssertTrue(list2!.count == 1)
        
        
    }
    
    func testIsNameExistBefore() {
        GamenList.deleteAllData()
        GamenList.add(name: "First Value", Date: Date())
        let list = GamenList.list()
        XCTAssertNotNil(list)
        XCTAssert(list!.count == 1)
        let firstCheck = GamenList.isNameExistBefore(name: "Second Name")
        XCTAssertFalse(firstCheck)
        let secondCheck = GamenList.isNameExistBefore(name: "First Value")
        XCTAssertTrue(secondCheck)
    }
    
    func testList(){
        GamenList.deleteAllData()
        GamenList.add(name: "First Value", Date: Date())
        GamenList.add(name: "Second Value", Date: Date())
        GamenList.add(name: "Third Value", Date: Date())
        let list =  GamenList.list()
        XCTAssertNotNil(list)
        XCTAssertTrue(list!.count == 3)
    }
    
    func testSortedByalphabetical(){
        
        GamenList.deleteAllData()
        GamenList.add(name: "bb", Date: Date())
        GamenList.add(name: "aa", Date: Date())
        GamenList.add(name: "cc", Date: Date())
       let list =  GamenList.sortedByalphabetical()
        
        XCTAssertNotNil(list)
        XCTAssertTrue(list!.count == 3)
        XCTAssertTrue(list![0].name == "aa")
        XCTAssertTrue(list![1].name == "bb")
        XCTAssertTrue(list![2].name == "cc")
        
        
    }
    
    func testSortedByDate(){
        
        GamenList.deleteAllData()
        
        let date1 = Date().addingTimeInterval(86400)
        let date2 = Date().addingTimeInterval(86411)
        let date3 = Date().addingTimeInterval(86422)
        
        GamenList.add(name: "aa", Date: date3)
        GamenList.add(name: "bb", Date: date1)
        GamenList.add(name: "cc", Date: date2)
        let list = GamenList.sortedByDate()
        XCTAssertNotNil(list)
        XCTAssertTrue(list!.count == 3)
        XCTAssertTrue(list![0].creationDate == date1)
        XCTAssertTrue(list![1].creationDate == date2)
        XCTAssertTrue(list![2].creationDate == date3)
        
    }
    
    override class func tearDown() {
        GamenList.deleteAllData()
    }
}
