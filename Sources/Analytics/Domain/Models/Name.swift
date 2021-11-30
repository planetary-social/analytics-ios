//
//  Name.swift
//  
//
//  Created by Martin Dutra on 4/9/21.
//

import Foundation

enum Name: String, CaseIterable {

    enum API: String, CaseIterable {
        case pub
        case verse
    }

    case background

    enum Cache: String, CaseIterable {
        case blob
        case text
        case truncatedText
    }

    case exit

    case backgroundFetch = "background_fetch"

    case backgroundTask = "background_task"

    case foreground

    case launch

    enum Log: String, CaseIterable {
        case error
        case fatal
        case info
        case unexpected
    }

    case receive_remote_notification = "receive_remote_notification"

    case notification

    case offboarding
    case onboarding

    case refresh

    case repair
    case db_update

    case settings

    case sync

    case stats

    // compiler seems to want this, must be related
    // to a nested enum having an associated value
    typealias RawValue = String
    case requiredCaseForRawValue
}
