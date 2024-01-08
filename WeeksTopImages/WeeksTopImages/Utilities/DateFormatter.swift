//
//  DateFormatter.swift
//  WeeksTopImages
//
//  Created by shiva kumar on 5/1/24.
//

import Foundation

extension DateFormatter {
    /// Creates a localized date formatter with the current locale.
    ///
    /// - Returns: A `DateFormatter` instance with the current locale.
    static func localizedFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        return formatter
    }

    func string(from date: Date, format: String) -> String {
        self.dateFormat = format
        return string(from: date)
    }
}
