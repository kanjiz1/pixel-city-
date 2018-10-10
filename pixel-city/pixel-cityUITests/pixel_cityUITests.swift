//
//  pixel_cityUITests.swift
//  pixel-cityUITests
//
//  Created by Oforkanji Odekpe on 10/10/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import XCTest

class pixel_cityUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        
        let app = XCUIApplication()
        let kerberParkMap = app.maps.containing(.other, identifier:"Kerber Park").element
        kerberParkMap.tap()
        kerberParkMap.tap()
        app/*@START_MENU_TOKEN@*/.maps.containing(.other, identifier:"Elm Creek Park Reserve").element.swipeLeft()/*[[".maps.containing(.other, identifier:\"Kerber Park\").element",".swipeUp()",".swipeLeft()",".maps.containing(.other, identifier:\"Elm Creek Park Reserve\").element"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        app.maps.containing(.other, identifier:"Forest View Pond Park").element.tap()
        
        let locationbuttonButton = app.buttons["locationButton"]
        locationbuttonButton.tap()
        kerberParkMap.tap()
        app.collectionViews.containing(.staticText, identifier:"C'mon!!!").element.tap()
        
        let collectionViewsQuery = app.collectionViews
        let element = collectionViewsQuery.children(matching: .cell).element(boundBy: 13).children(matching: .other).element
        element.tap()
        
        let element3 = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element
        let element2 = element3.children(matching: .other).element
        element2.tap()
        element2.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 15).children(matching: .other).element/*@START_MENU_TOKEN@*/.press(forDuration: 0.9);/*[[".tap()",".press(forDuration: 0.9);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        element2.tap()
        element3.children(matching: .other).element(boundBy: 1).tap()
        element.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 22).children(matching: .other).element/*@START_MENU_TOKEN@*/.press(forDuration: 0.6);/*[[".tap()",".press(forDuration: 0.6);"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        element2.tap()
        element2.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 2).children(matching: .other).element.tap()
        locationbuttonButton.tap()
        kerberParkMap.tap()
        kerberParkMap.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 8).children(matching: .other).element.tap()
        element2.tap()
        element2.tap()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
