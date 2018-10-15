//
//  V_String.swift
//  VCommon
//
//  Created by Gokhan Gultekin on 11.10.2018.
//

import Foundation

public extension String {
    
    func attributedString(text1: String, color1: UIColor, font1: UIFont, text2: String, color2: UIColor, font2: UIFont) -> NSMutableAttributedString {
        let attributedString1 = NSMutableAttributedString(string: text1, attributes: [
            .font: font1,
            .foregroundColor: color1])
        
        let attributedString2 = NSMutableAttributedString(string: text2, attributes: [
            .font: font2,
            .foregroundColor: color1])
        
        attributedString1.append(attributedString2)
        return attributedString1
    }
    
}
