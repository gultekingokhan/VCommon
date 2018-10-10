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
    
    public func isValidPhoneNumber() -> String {
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
}
