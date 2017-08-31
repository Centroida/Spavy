//
//  Extensions.swift
//  SwiftVersionNotifier
//
//  Created by Deyan Aleksandrov on 8/31/17.
//  Copyright © 2017 centroida. All rights reserved.
//

import Foundation

open class SpavyAppDelegate: UIResponder, UIApplicationDelegate {
    open var window: UIWindow?
    
    open var spavyFrame = CGRect(x: 100, y: 100, width: 60, height: 60)
    open var spavyBackgroundColor: UIColor = .orange
    open var spavyAlpha: CGFloat = 0.6
    open var spavyBorderWidth: CGFloat = 1.0
    open var spavyBorderColor: CGColor = UIColor.black.cgColor
    open var spavyCornerRadius: CGFloat = 5

    open var rootVC: UIViewController? {
        get {
            return window?.rootViewController
        }
        set {
            window?.rootViewController = newValue
        }
    }

    open var spavy: Spavy {
        let spavy = Spavy()

        // Setup notifier
        spavy.frame = spavyFrame
        spavy.backgroundColor = spavyBackgroundColor
        spavy.alpha = spavyAlpha
        spavy.layer.borderWidth = spavyBorderWidth
        spavy.layer.borderColor = spavyBorderColor
        spavy.layer.cornerRadius = spavyCornerRadius

        // Add Gesture Recognizer
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        spavy.addGestureRecognizer(gestureRecognizer)

        return spavy
    }

    func handlePan(_ gestureRecognizer: UIPanGestureRecognizer) {
        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            let translation = gestureRecognizer.translation(in: rootVC?.view)
            if let gestureRecognizerView = gestureRecognizer.view {
                gestureRecognizerView.center = CGPoint(x: gestureRecognizerView.center.x + translation.x, y: gestureRecognizerView.center.y + translation.y)
                gestureRecognizer.setTranslation(CGPoint.zero, in: rootVC?.view)
            }
        }
    }
}
