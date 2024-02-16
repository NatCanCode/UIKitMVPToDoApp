//
//  UIKitMVPToDoAppUITestsLaunchTests.swift
//  UIKitMVPToDoAppUITests
//
//  Created by N N on 15/02/2024.
//

import XCTest
@testable import UIKitMVPToDoApp

final class UIKitMVPToDoAppUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
