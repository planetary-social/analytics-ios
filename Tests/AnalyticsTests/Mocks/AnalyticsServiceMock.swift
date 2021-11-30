//
//  AnalyticsServiceMock.swift
//  
//
//  Created by Martin Dutra on 30/11/21.
//

import Foundation
@testable import Analytics

class AnalyticsServiceMock: AnalyticsService {

    var identified: Bool = false

    var isEnabled: Bool = true

    func identify(identity: Identity) {
        identified = true
    }

    func identify(statistics: Statistics) {

    }

    func updatePushToken(pushToken: Data?) {

    }

    func optIn() {

    }

    func optOut() {

    }

    func forget() {

    }

    func time(event: Event, element: Element, name: Name.RawValue) {

    }

    func track(event: Event, element: Element, name: Name.RawValue, params: [String : Any]?) {
        
    }


}
