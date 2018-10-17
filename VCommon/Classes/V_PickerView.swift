//
//  V_PickerView.swift
//  VCommon
//
//  Created by Gokhan Gultekin on 12.10.2018.
//

import Foundation

public protocol V_PickerViewDelegate {

    func didSelectIndexFromPickerView(index: Int)
}

public class V_PickerView: UIView, UIPickerViewDelegate, UIPickerViewDataSource {
 
    @IBOutlet private var contentView: UIView!
    @IBOutlet public weak var closeButton: UIButton!
    @IBOutlet public weak var titleLabel: UILabel!
    @IBOutlet public weak var chooseButton: UIButton!
    @IBOutlet private weak var pickerView: UIPickerView!

    public let componentHeight: CGFloat = 300
    
    public var delegate: V_PickerViewDelegate?
    public var data:[String] = [] {
        didSet {
        pickerView.reloadAllComponents() }
    }
    
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
 
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.frame = CGRect(x: 0,
                            y: UIScreen.main.bounds.size.height,
                            width: UIScreen.main.bounds.size.width,
                            height: componentHeight)
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    public func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    //MARK: Button actions
    @IBAction func chooseButtonTapped(_ sender: Any) {
        delegate?.didSelectIndexFromPickerView(index: pickerView.selectedRow(inComponent: 0))
        hide()
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        hide()
    }
    
    public func show(from: UIViewController) {
        from.view.addSubview(self)
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform(translationX: 0, y: -self.componentHeight)
        }, completion: nil)
    }
    
    private func hide() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.transform = CGAffineTransform(translationX: 0, y: self.componentHeight)
        }, completion:{ (completion) in
            self.removeFromSuperview()
        })
    }
}

public extension UIViewController {
    
    func hideAllPickerViews() {
        for subview in view.subviews {
            if subview.isKind(of: V_PickerView.self) {
                subview.removeFromSuperview()
            }
        }
    }
}
