//
//  StringExtensionsTest.swift
//  iArtistTests
//
//  Created by Komal Sanghani on 8/15/21.
//

import XCTest
@testable import iArtist

class StringExtensionsTest: XCTestCase {

    func testConvertToDisplayFormat() {
        
        let dateString = "2007-10-14T12:00:00Z"
        let expectedOutput = "Oct 14,2007"
        let result = dateString.convertToDisplayFormat(dateFormat: "MMM dd,yyyy")
        XCTAssertEqual(expectedOutput, result)
    }

}
