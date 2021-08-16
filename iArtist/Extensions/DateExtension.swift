//
//  DateExtension.swift
//  iArtist
//
//  Created by Komal Sanghani on 8/15/21.
//

import Foundation

extension Date {
    
    func convertToMonthDayYearFormat(dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: self)
    }
}
