//
//  GallerySearchService.swift
//  WeeksTopImagesTests
//
//  Created by shiva kumar on 7/1/24.
//

import XCTest

@testable import WeeksTopImages

final class GallerySearchServiceTests: XCTestCase {
    
    private var apiKey: String? = nil
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        apiKey = GallerySearchService.loadConfig().value(for: "IMGUR_API_KEY") 
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchImages() {
        let gallerySearchService = GallerySearchService()
        
        let expectation = XCTestExpectation(description: "API Request Expectation")
        
        gallerySearchService.searchImages(query: "cats") { results, error in
            XCTAssertNotNil(results, "Search result should not be nil")
            XCTAssertNil(error, "Error should be nil")
            
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }

}
