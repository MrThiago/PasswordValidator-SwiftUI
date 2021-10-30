//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Thiago Gouvea on 29/10/2021.
//

import XCTest

class Tests_iOS: XCTestCase {

    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        // UI tests must launch the application that they test.
        app = XCUIApplication()
        app.launch()
    }

    func testInitialViewState() throws {
        let textField = app.textFields.element
        
        XCTAssert(textField.exists)
        XCTAssertEqual(textField.placeholderValue, "Type your password")
    }
    
    func testValidatorStrong() throws {
        let textField = app.textFields.element
        let result = app.staticTexts["result"]
        
        textField.tap()
        textField.typeText("M")
        textField.typeText("r")
        textField.typeText("T")
        textField.typeText("1")
        textField.typeText("2")
        textField.typeText("$")
        textField.typeText("£")
        textField.typeText("z")
        textField.typeText("z")
        
        XCTAssertEqual(result.label, "Strong")
    }
    
    func testValidatorWeak() throws {
        let textField = app.textFields.element
        let result = app.staticTexts["result"]
        
        textField.tap()
        textField.typeText("M")
        textField.typeText("r")
        textField.typeText("T")
        
        XCTAssertEqual(result.label, "Weak")
    }
    
    func testValidatorEmpty() throws {
        let textField = app.textFields.element
        let result = app.staticTexts["result"]
        
        textField.tap()
        
        XCTAssertEqual(result.label, "Empty")
    }
}
