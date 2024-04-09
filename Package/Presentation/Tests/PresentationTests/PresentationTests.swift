import XCTest
import SwiftUI
import ViewInspector
import Kingfisher
@testable import Presentation

final class PresentationTests: XCTestCase {
    
    var sut: CardDetailsView!
    var store: Store!
    
    func testExample() throws {
        // XCTest Documentation
        // https://developer.apple.com/documentation/xctest

        // Defining Test Cases and Test Methods
        // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    }
    
    func testCardCellView() throws {
        let view = CardCellView(name: "Ancestor's Chosen", imageUrl: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130550&type=card")
        XCTAssertNotNil(view)
        XCTAssertEqual(view.name, "Ancestor's Chosen")
        XCTAssertEqual(view.imageUrl, "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130550&type=card")
    }
    
}
