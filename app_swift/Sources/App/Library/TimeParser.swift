//
//  TimeParser.swift
//  
//
//  Created by Igor Belov on 04.09.2022.
//

import Foundation

struct TimeParser {
    private let formatter = DateFormatter()
    
    var dateFormat: String {
        get {
            formatter.dateFormat
        }
        set {
            formatter.dateFormat = newValue
        }
    }
    
    init(timeZone: TimeZone? = nil) {
        if let timeZone = timeZone {
            formatter.timeZone = timeZone
        }
    }
    
    func getString(from date: Date) -> String {
        formatter.string(from: date)
    }
}
