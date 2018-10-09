//
//  V_Date.swift
//  VCommon
//
//  Created by Gokhan Gultekin on 8.10.2018.
//

import Foundation

public extension Date {
    
    func aWeekBefore() -> Date {
        return daysBefore(days: 7)
    }
    
    func aWeekAfter() -> Date {
        return daysAfter(days: 7)
    }

    func daysBefore(days: Int) -> Date {
        return daysAfter(days:-days)
    }
    
    func daysAfter(days: Int) -> Date {
        return self.addingTimeInterval(TimeInterval(days * 24 * 60 * 60))
    }
    
    func dateAfterYears(years: Int) -> Date {
        return Calendar.current.date(byAdding: .year, value: years, to: self)!
    }
    
    func dateBeforeYears(years: Int) -> Date {
        return dateAfterYears(years: -years)
    }
    
    func daysFrom(date: Date) -> Int {
        let days = Calendar.current.dateComponents([.day], from: self, to: date).day!
        return abs(days)
    }
    
    func isToday() -> Bool {
        return self == Date()
    }
    
    func isYesterday() -> Bool {
        let yesterday = Date().daysBefore(days: 1)
        return self.isSameDayWith(date: yesterday)
    }
    
    func isSameDayWith(date: Date) -> Bool {
        let calendar = Calendar.current
        let dc1 = calendar.dateComponents([.day, .month, .year], from: self)
        let dc2 = calendar.dateComponents([.day, .month, .year], from: date)
        return (dc1.day == dc2.day && dc1.month == dc2.month && (dc1.year != nil) && (dc2.year != nil))
    }
    
}

extension String { //Use this extension where dates in String format
    
    func convert(inputFormat: String, outputFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = outputFormat
        return dateFormatter.string(from: date!)
    }
}

public struct V_Date {
    
    public static func date(from: String, format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: from)!
    }
    
    public static func string(from: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: from)
    }
    
    public static func humanReadableTime(seconds: Int) -> String {
        let hours = Int(seconds) / 3600
        let minutes = Int(seconds) / 60 % 60
        let seconds = Int(seconds) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
}
