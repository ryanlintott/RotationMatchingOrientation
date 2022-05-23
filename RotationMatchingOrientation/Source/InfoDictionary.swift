//
//  InfoDictionary.swift
//  FrameUp
//
//  Created by Ryan Lintott on 2021-05-11.
//

import SwiftUI

struct InfoDictionary {
    /// Supported orientations for the current app.
    static let supportedDeviceOrientations: Set<UIDeviceOrientation> = {
        if let orientations = Bundle.main.infoDictionary?["UISupportedInterfaceOrientations"] as? [String] {
            return Set(orientations.compactMap({ UIDeviceOrientation(key: $0) }))
        } else {
            return []
        }
    }()
    
    static let supportedInterfaceOrientations: [InterfaceOrientation] = {
        if let orientations = Bundle.main.infoDictionary?["UISupportedInterfaceOrientations"] as? [String] {
            return orientations.compactMap { InterfaceOrientation(key: $0) }
        } else {
            return []
        }
    }()
}
