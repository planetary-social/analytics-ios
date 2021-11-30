//
//  PotHogService.swift
//  
//
//  Created by Martin Dutra on 5/9/21.
//

import Foundation
import PostHog
import Logger
import Secrets

class PostHogService: AnalyticsService {

    var isEnabled: Bool {
        return posthog != nil
    }

    var posthog: PHGPostHog?

    init() {
        Logger.shared.info("Configuring PostHog...")
        guard let apiKey = Secrets.shared.get(key: .posthog) else {
            return
        }

        let configuration = PHGPostHogConfiguration(apiKey: apiKey,
                                                    host: "https://app.posthog.com")

        // Record certain application events automatically!
        configuration.captureApplicationLifecycleEvents = true

        // Record screen views automatically!
        configuration.recordScreenViews = true

        PHGPostHog.setup(with: configuration)
        
        posthog = PHGPostHog.shared()
    }

    func identify(identity: Identity) {
        posthog?.identify(identity.identifier,
                          properties: ["Network": identity.network,
                                       "$name": identity.name ?? ""])
    }

    func identify(statistics: Statistics) {
        // TODO: Fill
    }

    func updatePushToken(pushToken: Data?) {
        // TODO: Remove
    }

    func optIn() {
        // TODO: Remove
    }

    func optOut() {
        // TODO: Remove
    }

    func forget() {
        posthog?.reset()
    }

    func time(event: Event, element: Element, name: Name.RawValue) {
        // TODO: Remove
    }

    func track(event: Event, element: Element, name: Name.RawValue, params: [String : Any]?) {
        let event = event.rawValue
        let element = element.rawValue
        //let name = String(name.rawValue)

        posthog?.capture("did", properties: ["element": element, "name": name, "params": params])
        // UserDefaults.standard.didTrack(event)
    }

}
