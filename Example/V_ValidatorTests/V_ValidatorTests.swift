//
//  V_ValidatorTests.swift
//  V_ValidatorTests
//
//  Created by Gokhan Gultekin on 10.10.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import VCommon

class V_ValidatorTests: XCTestCase {

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

    func testTrimWhiteSpaces() {
        let stringBeforeTrim = "Have to type a sentence with spaces."
        let stringAfterTrim = stringBeforeTrim.trimWhiteSpaces()
        XCTAssertEqual(stringAfterTrim, "Havetotypeasentencewithspaces.")
    }
    
    func testIsValidEmail() {
        XCTAssertFalse("gokhan.gultekin@vektortelekom.m".isValidEmail())
        XCTAssertFalse("gokhan.gultekinvektortelekom.com".isValidEmail())
        XCTAssertFalse("gokhan.gultekin@vektortelekom".isValidEmail())
        XCTAssertNotNil("".isValidEmail())
        XCTAssertTrue("gokhan.gultekin@vektortelekom.com".isValidEmail())
    }
    
    func testIsValidIdentityNumber() {
        XCTAssertNotNil("".isValidIdentityNumber())
        XCTAssertFalse("1234.678901".isValidIdentityNumber())
        XCTAssertTrue("12345678901".isValidIdentityNumber())
    }

    func testIsValidPassword() {
        XCTAssertFalse("".isValidPassword())
        XCTAssertFalse("12345".isValidPassword())
        XCTAssertTrue("1234567".isValidPassword())
    }
    
    func testIsValidGender() {
        XCTAssertFalse("G".isValidGender())
        XCTAssertFalse("f".isValidGender())
        XCTAssertTrue("F".isValidGender())
        XCTAssertTrue("M".isValidGender())
    }
    
    func testIsValidOBDDeviceId() {
        XCTAssertTrue("WLqNLeAtgdKP6rt408NRvIrsaFvLqRnPQ8UloiX53uhJKTAeJOSYrxlxJ40smZ-Mh43mFk6VA50U64m2yvrP-Bqa33cAcMAj".isValidOBDDeviceId()) //Tested with a random text generated from this tool: https://onlinerandomtools.com/generate-random-data-from-regexp
    }
    
    func testIsValidAuthCode() {
        XCTAssertTrue("qUpgqPSUkgNPtq6SID-V2lZiy8o_oD83R8OdSD5XbJEttcDtdAp03c-dqfg_Sm3DdXo1SnZYHUecJGj".isValidAuthCode()) //Tested with a random text generated from this tool: https://onlinerandomtools.com/generate-random-data-from-regexp
    }
    
    func testIsValidYear() {
        XCTAssertFalse("192".isValidYear())
        XCTAssertTrue("1923".isValidYear())
    }
    
    func testIsValidBirthday() {
        XCTAssertFalse("2102198".isValidYear())
        XCTAssertTrue("21021989".isValidBirthday())
    }
    
    func testIsValidOdometer() {
        XCTAssertTrue("718531".isValidOdometer()) //Tested with a random text generated from this tool: https://onlinerandomtools.com/generate-random-data-from-regexp
    }
    
    func testIsValidEngineCapacity() {
        XCTAssertTrue("8376".isValidEngineCapacity()) //Tested with a random text generated from this tool: https://onlinerandomtools.com/generate-random-data-from-regexp
    }
    
    func testIsValidVehicleName() {
        XCTAssertFalse("".isValidVehicleName())
    }
    
    func testIsValidPlate() {
        XCTAssertFalse("".isValidPlate())
    }
    
    func testValidatePhoneNumber() {
        XCTAssertEqual("+905346341782", "5346341782".isValidPhoneNumber())
        XCTAssertEqual("+905346341782", "05346341782".isValidPhoneNumber())
        XCTAssertEqual("+905346341782", "+905346341782".isValidPhoneNumber())
    }
}
