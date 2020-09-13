//
//  Date+Extension.swift
//  News
//
//  Created by Nguyen The Phuong on 9/13/20.
//  Copyright © 2020 Tokoin. All rights reserved.
//

import Foundation

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    return formatter
}()

extension Date {
    var rssString: String {
        let formatter = DateFormatter()
        let isToday = Calendar.current.isDateInToday(self)
        
        guard isToday else {
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter.string(from: self)
        }
        
        let diff: TimeInterval = Date().timeIntervalSince1970 - self.timeIntervalSince1970
        
        guard diff.hours == 0 else {
            return "\(diff.hours) " + L10n.rssHoursAgo
        }
        
        guard diff.minutes == 0 else {
            return "\(diff.minutes) " + L10n.rssMinutesAgo
        }
        
        return L10n.rssJustNow
    }
}

extension TimeInterval {
    var milliseconds: Int {
        return Int((truncatingRemainder(dividingBy: 1)) * 1000)
    }

    var seconds: Int {
        return Int(self) % 60
    }

    var minutes: Int {
        return (Int(self) / 60 ) % 60
    }

    var hours: Int {
        return Int(self) / 3600
    }
}
