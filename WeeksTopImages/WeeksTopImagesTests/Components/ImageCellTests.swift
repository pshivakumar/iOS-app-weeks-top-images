//
//  ImageCellTests.swift
//  WeeksTopImagesTests
//
//  Created by shiva kumar on 8/1/24.
//

import XCTest
import ViewInspector
@testable import WeeksTopImages

final class ImageCellTests: XCTestCase {
    let image1Detail = ImageDetail(link: URL(string: "https://i.imgur.com/qjoeeTp.jpg")!)
    let image2Detail = ImageDetail(link: URL(string: "https://i.imgur.com/qjoeeTp.jpg")!)
    var imageModel: ImageModel!
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.imageModel = ImageModel(id: "OV7T0Ws", title: "what are you doing up there?? cats are cats", datetime: 1704622864, images: [image1Detail, image2Detail])
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /// Unit Test for a SwiftUI Component
    ///  USing EXternal library - ViewInspector
    func testImageCellListMode() throws {
        // Given - Created a List Cell
        let imageCell = ImageCell(result: self.imageModel, isListMode: true)
        
        // Then
        XCTAssertNoThrow(try imageCell.inspect().find(text: "what are you doing up there?? cats are cats").string(), "Text content in list mode should match")
    }
    
    func testImageCellGridMode() {
        //Given - Created a Grid Cell
        let imageCell = ImageCell(result: self.imageModel, isListMode: false)
        
        // Then
        XCTAssertNoThrow(try imageCell.inspect().find(text: "what are you doing up there?? cats are cats").string(), "Text content in grid mode should match")
    }
}
