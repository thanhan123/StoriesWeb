//
//  UIEdgeInsets+SafeAreaInsetsKey.swift
//  StoriesWeb
//
//  Created by Owner on 2024/10/26.
//

import Foundation
import SwiftUI

extension UIApplication {
    var keyWindow: UIWindow? {
        // Get connected scenes
        connectedScenes
            // Keep only active scenes, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive }
            // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
            // Get its associated windows
            .flatMap { $0 as? UIWindowScene }?.windows
            // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }
}

private struct SafeAreaInsetsKey: EnvironmentKey {
    static var defaultValue: EdgeInsets {
        (UIApplication.shared.keyWindow?.safeAreaInsets ?? .zero).insets
    }
}

extension EnvironmentValues {
    var safeAreaInsets: EdgeInsets {
        self[SafeAreaInsetsKey.self]
    }
}

private extension UIEdgeInsets {
    var insets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}
