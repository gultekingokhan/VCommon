//
//  ViewController.swift
//  VCommon
//
//  Created by gultekingokhan on 10/04/2018.
//  Copyright (c) 2018 gultekingokhan. All rights reserved.
//

import UIKit
import VCommon

class ViewController: UIViewController, V_PickerViewDelegate, V_ImagePreviewDelegate {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var showPickerViewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Demonstrating how to use hex code converter from color extensions
        view.backgroundColor = UIColor().hex(string: "FC5450")
        
        //Demonstating how to use date extensions and one of the examples that can be interacted with UI
        timerLabel.text = V_Date.humanReadableTime(seconds: 1924)
        
    }

    @IBAction func openImagePreview() {
        
        let imagePreviewVC = V_ImagePreviewViewController()
        imagePreviewVC.imageToShow = UIImage(named: "spacex-example")
        imagePreviewVC.delegate = self
        present(imagePreviewVC, animated: true, completion: nil)
    }
    
    @IBAction func showPickerButtonTapped(_ sender: Any) {
        
        let pickerView = V_PickerView()
        pickerView.delegate = self
        pickerView.data = ["1", "2", "3"]
        pickerView.show(from: self)
    }
    
    func didSelectIndexFromPickerView(index: Int) {
        print("Selected index from picker: \(index)")
    }
}

