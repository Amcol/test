import XCTest

class UITestProjectUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {}


    func testToggle() throws {
        let app = XCUIApplication()
        let toggle = app.checkBoxes["Toggle"]
        
        toggle.click()
        XCTAssertTrue(toggle.label.contains("Toggle State: On"))
    }
    
    func testShowTextButton() throws {
        let app = XCUIApplication()
        let showTextButton = app.buttons["ShowTextButton"]

        showTextButton.click()

        let helloWorldText = app.staticTexts["HelloWorldText"]
        XCTAssertTrue(helloWorldText.exists)
    }

    func testDatePicker() throws {
        let app = XCUIApplication()
        let datePicker = app.datePickers["DatePicker"]
        datePicker.click()
        
        XCTAssertTrue(datePicker.exists)
    }

    func testButtonsAndSheets() throws {
        let app = XCUIApplication()
        
        let redButton = app.buttons["RedButton"]
        let greenButton = app.buttons["GreenButton"]
        let blueButton = app.buttons["BlueButton"]
        let alert = app.sheets["alert"]

        redButton.tap()
        XCTAssertTrue(alert.exists)
        XCTAssertTrue(alert.staticTexts["You pressed the Red button"].exists)
        alert.buttons["OK"].click()
        
        greenButton.tap()
        XCTAssertTrue(alert.exists)
        XCTAssertTrue(alert.staticTexts["You pressed the Green button"].exists)
        alert.buttons["OK"].click()
        
        blueButton.tap()
        XCTAssertTrue(alert.exists)
        XCTAssertTrue(alert.staticTexts["You pressed the Blue button"].exists)
        alert.buttons["OK"].click()
    }
}
