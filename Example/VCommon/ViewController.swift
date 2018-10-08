//
//  ViewController.swift
//  VCommon
//
//  Created by gultekingokhan on 10/04/2018.
//  Copyright (c) 2018 gultekingokhan. All rights reserved.
//

import UIKit
import VCommon


struct DateHelper {

    static func generateDate(string: String, format: String = "yyyy-MM-dd") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.dateFormat = format

        return dateFormatter.date(from: string)!
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor().hex(string: "FC5450")
//        
//        let given = DateHelper.generateDate(string: "2019-02-21")
//        let expected = DateHelper.generateDate(string: "2019-02-14")
////
//        print("Date: \(V_Date.aWeekBefore(date: given))")

        //perform(#selector(openTestVC), with: self, afterDelay: 3.0)
    }
    
    @objc func openTestVC() {
        
        //This is an example for loading xib files from the Pod. You are free to remove the lines below.
        let containingBundle = Bundle(for: TestViewController.self)
        let bundleURL = containingBundle.url(forResource: "VCommon", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)
        let vc = TestViewController(nibName: "TestViewController", bundle: bundle)
        present(vc, animated: true, completion: nil)
    }
}

