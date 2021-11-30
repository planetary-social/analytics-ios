//
//  AnalyticsService.swift
//  
//
//  Created by Martin Dutra on 30/11/21.
//

import Foundation

protocol AnalyticsService {

    var isEnabled: Bool { get }

    func identify(identity: Identity)
    func identify(statistics: Statistics)
    func updatePushToken(pushToken: Data?)
    func optIn()
    func optOut()
    func forget()
    func time(event: Event, element: Element, name: Name.RawValue)
    func track(event: Event, element: Element, name: Name.RawValue, params: [String: Any]?)

}

// MARK: Track single param
extension AnalyticsService {

    func track(event: Event, element: Element, name: Name.RawValue, param: String? = nil, value: String? = nil) {
        var params: [String: Any] = [:]
        if let param = param, let value = value { params[param] = value }
        self.track(event: event, element: element, name: name, params: params)
    }

}

// MARK: Lexicon
extension AnalyticsService {

    /// Returns an alphabetically sorted list of composited event names.  This is useful to list
    /// the potential event names that could be used in Mixpanel.
    func lexicon() -> [String] {
        var strings: [String] = []
        for event in Event.allCases {
            for element in Element.allCases {
                for name in Name.allCases {
                    let string = self.eventName(event: event, element: element, name: name.rawValue)
                    strings += [string]
                }
            }
        }
        return strings
    }

    /// Returns a underscored string that has merged the arguments.
    func eventName(event: Event, element: Element, name: Name.RawValue) -> String {
        let strings = [event.rawValue, element.rawValue, name]
        let merged = strings.joined(separator: "_")
        return merged
    }

}
