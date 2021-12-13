//
//  PostHogServiceTests.swift
//  
//
//  Created by Martin Dutra on 11/12/21.
//

import XCTest
@testable import Analytics
import PostHog

final class PosthogServiceTests: XCTestCase {

    private var secrets: SecretsMock!
    private var middleware: MiddlewareMock!
    private var service: PostHogService!

    override func setUp() {
        secrets = SecretsMock()
        secrets.value = "test"
        middleware = MiddlewareMock()
        service = PostHogService(secrets: secrets, middlewares: [middleware])
    }

    func testIsEnabled() {
        XCTAssertTrue(service.isEnabled)
    }

    func testFunctions() {
        let identity = Identity(identifier: "user-hash", name: "John Doe", network: "network-hash")
        service.identify(identity: identity)
        XCTAssertEqual(middleware.lastContext?.eventType, .identify)

        service.track(event: "test", params: nil)
        XCTAssertEqual(middleware.lastContext?.eventType, .capture)

        service.forget()
        XCTAssertEqual(middleware.lastContext?.eventType, .reset)
    }

}
