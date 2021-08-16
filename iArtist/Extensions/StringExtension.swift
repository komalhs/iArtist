//
//  StringExtension.swift
//  iArtist
//
//  Created by Komal Sanghani on 8/15/21.
//

import Foundation

extension String {
    
    // Converts String to Date
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        return dateFormatter.date(from: self)
    }
    
    /**
     Converts date into display format
     - Parameter dateFormat: desired format of date as a String
     - Parameter message: message displayed on alert
     - Parameter buttonTitle: button text
     
     - Returns: String as per given dateFormat
     */
    func convertToDisplayFormat(dateFormat: String) -> String {
        guard let date = self.convertToDate() else { return "N/A" }
        return date.convertToMonthDayYearFormat(dateFormat: dateFormat)
    }
}
