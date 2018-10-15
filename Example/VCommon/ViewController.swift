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

    //@IBOutlet weak var timerLabel: UILabel!
    //@IBOutlet weak var pickerView: V_PickerView!
    
    @IBOutlet weak var showhidePickerViewButton: UIButton!
    @IBAction func showhidePickerViewButtonTapped(_ sender: Any) {
    
        if isPickerViewShown() {
            hidePickerView()
            showhidePickerViewButton.setTitle("Hide picker view", for: .normal)
        } else {
            showPickerView()
            showhidePickerViewButton.setTitle("Show picker view", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Demonstrating how to use hex code converter from color extensions
        view.backgroundColor = UIColor().hex(string: "FC5450")
        
        //Demonstating how to use date extensions and one of the examples that can be interacted with UI
        //timerLabel.text = V_Date.humanReadableTime(seconds: 1924)
    
        //let text = "hello from the other side"
        //timerLabel.attributedText = text.multipleBoldSubstrings(substringArray: ["from", "other"], size: 20, color: UIColor.white)
    }
    
    @objc func openTestVC() {
        
        //This is an example for loading xib files from the Pod. You are free to remove the lines below.
        let containingBundle = Bundle(for: TestViewController.self)
        let bundleURL = containingBundle.url(forResource: "VCommon", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)
        let vc = TestViewController(nibName: "TestViewController", bundle: bundle)
        present(vc, animated: true, completion: nil)
        //TODO: Find the way that calling resource from bundle more easily.
    }
    
    
    
    
}

