//
//  V_DateTests.swift
//  V_DateTests
//
//  Created by Gokhan Gultekin on 8.10.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import VCommon
class V_DateTests: XCTestCase {

    let givenDate = DateHelper.generateDate(string: "2019-02-21 15:00")
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testDaysAfter() {
        let expectedDate    = DateHelper.generateDate(string: "2019-02-26 15:00")
        let resultDate      = givenDate.daysAfter(days: 5)
        XCTAssertEqual(resultDate, expectedDate)
    }

    func testDayBefore() {
        let expectedDate    = DateHelper.generateDate(string: "2019-02-16 15:00")
        let actualDate      = givenDate.daysBefore(days: 5)
        XCTAssertEqual(actualDate, expectedDate)
    }
    
    func testAWeekBefore() {
        let expectedDate    = DateHelper.generateDate(string: "2019-02-14 15:00")
        let actualDate      = givenDate.aWeekBefore()
        XCTAssertEqual(actualDate, expectedDate)
    }
    
    func testAWeekAfter() {
        let expectedDate    = DateHelper.generateDate(string: "2019-02-28 15:00")
        let actualDate      = givenDate.aWeekAfter()
        XCTAssertEqual(actualDate, expectedDate)
    }
    
    func testDateAfterYears() {
        let expectedDate    = DateHelper.generateDate(string: "2021-02-21 15:00")
        let actualDate      = givenDate.dateAfterYears(years: 2)
        XCTAssertEqual(actualDate, expectedDate)
    }
    
    func testDateBeforeYears() {
        let expectedDate    = DateHelper.generateDate(string: "2017-02-21 15:00")
        let actualDate      = givenDate.dateBeforeYears(years: 2)
        XCTAssertEqual(actualDate, expectedDate)
    }
    
    func testDateFromStringWithFormat() {
        let actualDate = V_Date.date(from: "21.02.2019 15:00", format: "dd.MM.yyyy HH:mm")
        XCTAssertEqual(actualDate, givenDate /*as expected*/)
    }
    
    func testStringFromDateWithFormat() {
        let expectedDate    = "2019-02-21 15:00"
        let actualDate      = V_Date.string(from: givenDate, format: "yyyy-MM-dd HH:mm")
        XCTAssertEqual(actualDate, expectedDate)
    }
    
    func testConvertFromInputFormatToOutputFormat() {
        let givenDateString = "2019-02-21 15:00"
        let expected        = "Thursday, 21 February 2019"
        let actual          = givenDateString.convert(inputFormat: "yyyy-MM-dd HH:mm", outputFormat: "EEEE, 21 MMMM 2019")
        XCTAssertEqual(actual, expected)
    }
    
    func testDaysBetweenTwoDates() {
        let date1 = DateHelper.generateDate(string: "2019-02-21 15:00")
        let date2 = DateHelper.generateDate(string: "2019-02-16 15:00")
        
        let days = date1.daysFrom(date: date2)
        XCTAssertEqual(days, 5)
        XCTAssertNotEqual(days, -5)
    }
    /*
    func testDateIsEqualToOtherDate() {
        let date1 = DateHelper.generateDate(string: "2019-02-21 15:00")
        let date2 = DateHelper.generateDate(string: "2019-02-21 15:00")
        
        XCTAssertEqual(date1, date2)
    }
    */
}

struct DateHelper {
    
    static func generateDate(string: String, format: String = "yyyy-MM-dd HH:mm") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: string)!
    }
}
