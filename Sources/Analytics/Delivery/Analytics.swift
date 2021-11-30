//
//  Analytics.swift
//  
//
//  Created by Martin Dutra on 30/11/21.
//

public class Analytics {

    public static let shared = Analytics()

    var service: AnalyticsService

    init(service: AnalyticsService = PostHogService()) {
        self.service = service
    }

    public func identify(identifier: String, name: String?, network: String) {
        service.identify(identity: Identity(identifier: identifier, name: name, network: network))
    }
    
}
