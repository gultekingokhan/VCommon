//
//  V_View.swift
//  VCommon
//
//  Created by Gokhan Gultekin on 10.10.2018.
//

import Foundation

public extension UIView {
    
    public func roundCorners(radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    public func makeCircle() {
        layer.cornerRadius = self.frame.size.width/2
    }
    
    public func dropShadow() {
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 0.70
        layer.shadowRadius = 12
        layer.shadowColor = UIColor.lightGray.cgColor
    }
}
