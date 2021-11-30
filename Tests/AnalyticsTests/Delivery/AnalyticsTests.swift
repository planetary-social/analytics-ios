//
//  AnalyticsTests.swift
//
//
//  Created by Martin Dutra on 30/11/21.
//

import XCTest
@testable import Analytics

final class AnalyticsTests: XCTestCase {

    private var service: AnalyticsServiceMock!
    private var analytics: Analytics!

    override func setUp() {
        service = AnalyticsServiceMock()
        analytics = Analytics(service: service)
    }

    func testIdentify() {
        analytics.identify(identifier: "", name: nil, network: "")
        XCTAssertTrue(service.identified)
    }
}
