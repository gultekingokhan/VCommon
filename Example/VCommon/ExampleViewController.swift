//
//  ExampleViewController.swift
//  VCommon_Example
//
//  Created by Gokhan Gultekin on 17.10.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import VCommon

class ExampleViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let titles = ["Load url into the web view", "Preview image", "Show example picker view"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ReuseIdentifier")
    }
}

extension ExampleViewController: UITableViewDataSource, UITableViewDelegate, V_PickerViewDelegate, V_ImagePreviewDelegate {

    func didSelectIndexFromPickerView(index: Int) {
        print("Selected index from picker view: \(index)")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return SectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: SectionView.height))
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return SectionView.height
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseIdentifier", for: indexPath)
        cell.textLabel?.text = titles[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Avenir", size: 16)
        cell.selectionStyle = .gray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            
            let webviewVC = V_WebViewController()
            let navigationController = UINavigationController(rootViewController: webviewVC)
            webviewVC.url = URL(string: "https://google.com")
            present(navigationController, animated: true, completion: nil)

            break
        case 1:
            
            let imagePreviewVC = V_ImagePreviewViewController()
            imagePreviewVC.imageToShow = UIImage(named: "spacex-example")
            imagePreviewVC.delegate = self
            present(imagePreviewVC, animated: true, completion: nil)

            break
        case 2:
            
            hideAllPickerViews()
            
            let pickerView = V_PickerView()
            pickerView.delegate = self
            pickerView.data = ["1", "2", "3"]
            pickerView.show(from: self)

            break
        default:
            break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
