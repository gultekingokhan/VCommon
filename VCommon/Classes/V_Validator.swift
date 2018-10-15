//
//  V_Validator.swift
//  VCommon
//
//  Created by Gokhan Gultekin on 10.10.2018.
//

import Foundation

public extension String {
    
    public func trimWhiteSpaces() -> String {
        return self.components(separatedBy: .whitespaces).joined()
    }
    
    public func checkRegex(pattern: String) -> Bool {
        let regex = try? NSRegularExpression(pattern: pattern, options: [])

        let matches = regex?.matches(in: self, options: [], range: NSRange(location: 0, length: self.count))
        guard let matchesCount = matches?.count else {
            return false
        }
        return matchesCount > 0
    }

    public func isValidEmail() -> Bool {
        return self.checkRegex(pattern: "^([^@\\s]+)@((?:[-a-z0-9]+\\.)+[a-z]{2,})$")
    }
    
    public func isValidIdentityNumber() -> Bool {
        return self.checkRegex(pattern: "^[0-9]{1,20}$")
    }
    
    public func isValidPassword() -> Bool {
        return self.count >= 6
    }
    
    public func isValidGender() -> Bool {
        return self == "M" || self == "F"
    }

    public func isValidOBDDeviceId() -> Bool {
        return self.checkRegex(pattern: "^[a-zA-Z0-9_-]+$")
    }
    
    public func isValidAuthCode() -> Bool {
        return self.checkRegex(pattern: "^[a-zA-Z0-9_-]+$")
    }
    
    public func isValidYear() -> Bool {
        return self.checkRegex(pattern: "^[0-9]{4}$")
    }
    
    public func isValidBirthday() -> Bool {
        return self.checkRegex(pattern: "^[0-9]{8}$")
    }
    
    public func isValidOdometer() -> Bool {
        return self.checkRegex(pattern: "^[0-9]{1,6}$")
    }
    
    public func isValidEngineCapacity() -> Bool {
        return self.checkRegex(pattern: "^[0-9]{3,4}$")
    }
    
    public func isValidVehicleName() -> Bool {
        return self.checkRegex(pattern: "^([^\\t]+)(\\s+[^\\t]+)*$")
    }
    
    public func isValidPlate() -> Bool {
        return self.checkRegex(pattern: "^\\d{2}[A-Z]{1,3}[0-9]{2,5}$")
    }
    
    public func validatePhoneNumber() -> String {
        var number: String = self
        number = number.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        number = number.replacingOccurrences(of: "(", with: "")
        number = number.replacingOccurrences(of: ")", with: "")
        number = number.replacingOccurrences(of: "-", with: "")
        number = number.replacingOccurrences(of: " ", with: "")

        if number.hasPrefix("+90") || number.hasPrefix("00") {
            
        } else if number.hasPrefix("0") {
            number = "+9\(number)"
        } else if number.hasPrefix("90") {
            number = "+\(number)"
        } else {
            number = "+90\(number)"
        }
        return number
    }
    
    public func isValidPhoneNumber() -> Bool {
        return self.replacingOccurrences(of: " ", with: "").checkRegex(pattern: "[0]{1}[0-9]{10}")
    }
    
    /*Example usage of phone number formatter:
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 0 {
            let isDelete:Bool = string == "" ? true : false
            let value = textField.text?.phoneNumberFormatter(string: string, range: range, isDelete: isDelete)
            textField.text = value
            inputValidationHandler(textField: textField, isValid: (value?.isValidPhoneNumber())!)
            isValidationCompleted = (value?.isValidPhoneNumber())!
            return false
        }
        else if textField.tag == 1 {
            let value = textField.text?.appendedStringInRange(appendString: string, range: range)
            inputValidationHandler(textField: textField, isValid: (value?.isValidEmail())!)
            isValidationCompleted = (value?.isValidEmail())!
        }
        return true
    }
    */
    public func phoneNumberFormatter(string:String,range:NSRange,isDelete:Bool) -> String {
        var value = self
        let phoneNumberRegex = "[0-9]"
        let phoneNumberTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        
        if isDelete || phoneNumberTest.evaluate(with: string) {
            value = value.appendedStringInRange(appendString: string, range: range)
        }
        
        
        value = value.replacingOccurrences(of:" ", with:"")
        
        let mask = "XXXX XXX XX XX"
        
        return value.formatWithMask(mask)
    }
    
    public func appendedStringInRange(appendString: String, range: NSRange) -> String {
        let string = self as NSString?
        let newString = string?.replacingCharacters(in: range, with: appendString)
        return newString!
    }
    
    public func formatWithMask(_ mask: String) -> String {
        var result = ""
        var index = self.startIndex
        for ch in mask {
            if index == self.endIndex {
                break
            }
            if ch == "X" {
                result.append(self[index])
                index = self.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
    
    public func multipleBoldSubstrings(substringArray: [String], size: CGFloat, color:UIColor) -> NSMutableAttributedString {
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        for substring in substringArray {
            let pattern = substring.lowercased()
            let range: NSRange = NSMakeRange(0, Array(self).count)
            var regex = NSRegularExpression()
            do {
                regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options())
                regex.enumerateMatches(in: lowercased(), options: NSRegularExpression.MatchingOptions(), range: range) {
                    (textCheckingResult, matchingFlags, stop) in
                    let subRange = textCheckingResult?.range
                    let attributes : [NSAttributedString.Key : Any] = [.font : UIFont.boldSystemFont(ofSize: size),.foregroundColor: color]
                    attributedString.addAttributes(attributes, range: subRange!)
                }
            }catch{
                print(error.localizedDescription)
            }
        }
        return attributedString
    }
}
