//
//  V_PickerView.swift
//  VCommon
//
//  Created by Gokhan Gultekin on 12.10.2018.
//

import Foundation

public class V_PickerView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet private var contentView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var pickerView: UIPickerView!

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
      
        let containingBundle = Bundle(for: V_PickerView.self)
        let bundleURL = containingBundle.url(forResource: "VCommon", withExtension: "bundle")
        let bundle = Bundle(url: bundleURL!)
        bundle?.loadNibNamed("V_PickerView", owner: self, options: nil)
 
        addSubview(contentView)
        sendSubviewToBack(contentView)
        
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
 
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 10
        } else {
            return 100
        }
    }
    
    private func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return "First \(row)"
        } else {
            return "Second \(row)"
        }
    }
    
    
    //MARK: Button actions
    @IBAction func chooseButtonTapped(_ sender: Any) {
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
    }
}

public extension UIViewController {
    
    public func isPickerViewShown() -> Bool {
        
        for subview in view.subviews {
            if subview.isKind(of: V_PickerView.self) { return true }
        }
        return false
    }
    
    public func showPickerView() {
        let height: CGFloat = 236
        let pickerView = V_PickerView(frame: CGRect(x: 0,
                                                    y: UIScreen.main.bounds.size.height,
                                                    width: UIScreen.main.bounds.size.width,
                                                    height: height))
        view.addSubview(pickerView)
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
            pickerView.transform = CGAffineTransform(translationX: 0, y: -height)
        }, completion: nil)
    }
    
    public func hidePickerView() {
        
        let height: CGFloat = 236
        for subview in view.subviews {
            if subview.isKind(of: V_PickerView.self) {
                
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                    subview.transform = CGAffineTransform(translationX: 0, y: height)
                }, completion:{ (completion) in
                    subview.removeFromSuperview()
                })
            }
        }
    }
}
