//
//  V_ViewTests.swift
//  V_ViewTests
//
//  Created by Gokhan Gultekin on 10.10.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import VCommon

class V_ViewTests: XCTestCase {

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

    func testRoundCorners() {
        let view = UIView(frame: .zero)
        view.roundCorners(radius: 10)
        XCTAssertEqual(view.layer.cornerRadius, 10)
    }
    
    func testMakeCircle() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        view.makeCircle()
        XCTAssertEqual(view.layer.cornerRadius, 20)
    }
    
    func testDropShadow() {
        let view = UIView(frame: .zero)
        view.dropShadow()
        XCTAssertFalse(view.layer.masksToBounds)
        XCTAssertEqual(view.layer.shadowOffset, CGSize(width: 0, height: 0))
        XCTAssertEqual(view.layer.shadowOpacity, 0.70)
        XCTAssertEqual(view.layer.shadowRadius, 12)
        XCTAssertEqual(view.layer.shadowColor, UIColor.lightGray.cgColor)
    }
}
