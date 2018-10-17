//
//  SectionView.swift
//  VCommon_Example
//
//  Created by Gokhan Gultekin on 17.10.2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import VCommon

class SectionView: UIView {

    @IBOutlet private var contentView: UIView!
    static let height: CGFloat = 200
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        
        let bundle = Bundle(for: SectionView.self)
        bundle.loadNibNamed("SectionView", owner: self, options: nil)
        
        addSubview(contentView)
        sendSubviewToBack(contentView)
        
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    
        //MARK: Demonstrating how to use hex code converter from color extensions
        titleLabel.textColor = UIColor().hex(string: "FD9528")
        descriptionLabel.textColor = UIColor().hex(string: "4D4E4C")
    }

}
