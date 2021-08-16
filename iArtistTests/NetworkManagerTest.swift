//
//  NetworkManagerTest.swift
//  iArtistTests
//
//  Created by Komal Sanghani on 8/15/21.
//

import XCTest
@testable import iArtist

class NetworkManagerTest: XCTestCase {

    func testGetTrackValidResponse(){
                
        let networkManager = NetworkManager.shared
        let expectation = self.expectation(description: "ValidResponseReturnsData")
        
        networkManager.getTrackList(for: "taylor") { response in
            switch response {
            case .success(let trackData):
                XCTAssertNotNil(trackData)
                XCTAssertEqual(50, trackData.trackCount)
                XCTAssertNotNil(trackData.trackList)
            case .failure(let error):
                XCTAssertNil(error)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetTrackInValidResponse(){
                
        let networkManager = NetworkManager.shared
        let expectation = self.expectation(description: "InValidResponseReturnsData")
        
        networkManager.getTrackList(for: "john") { response in
            switch response {
            case .success(let trackData):
                XCTAssertNil(trackData)
                XCTAssertNil(trackData.trackList)
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(NetworkError.invalidData.rawValue, error.rawValue)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
