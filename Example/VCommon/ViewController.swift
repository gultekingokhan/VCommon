//
//  ViewController.swift
//  VCommon
//
//  Created by gultekingokhan on 10/04/2018.
//  Copyright (c) 2018 gultekingokhan. All rights reserved.
//

import UIKit
import VCommon

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor().hex(string: "FC5450")
        
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

