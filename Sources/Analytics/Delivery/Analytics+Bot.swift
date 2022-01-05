//
//  File.swift
//  
//
//  Created by Martin Dutra on 5/1/22.
//

import Foundation

public extension Analytics {

    func trackBotDidSkipMessage(key: String, reason: String) {
        service.track(event: .did, element: .bot, name: "sync", params: ["Skipped": key,
                                                                         "Reason": reason])
    }

    func trackBotDidUpdateMessages(count: Int) {
        service.track(event: .did, element: .bot, name: "db_update", param: "inserted", value: "\(count)")
    }

}
