//
//  V_ColorExtensionsTests.swift
//  V_ColorExtensionsTests
//
//  Created by Gokhan Gultekin on 5.10.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import VCommon

class V_ColorExtensionsTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHexColorNotNil() {
        let example = "FC5450"
        XCTAssertNotNil(UIColor().hex(string: example))
    }
    
    func testemptyHexCode() {
        let example = ""
        XCTAssertNotNil(UIColor().hex(string: example))
    }
    
    func testWithOrWithoutPrefix() {
        XCTAssertEqual(UIColor().hex(string: "FC5450"), UIColor().hex(string: "#FC5450"))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
