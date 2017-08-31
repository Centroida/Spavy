//
//  Spavy.swift
//  Spavy
//
//  Created by Deyan Aleksandrov on 8/31/17.
//  Copyright © 2017 centroida. All rights reserved.
//

import UIKit

open class Spavy: UIView {

    // MARK: - Variables
    var version = "Unknown"

    var appConfigVersionLabel: UILabel {
        let label = UILabel()
        label.frame = bounds
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping // notice the 'b' instead of 'B'
        label.numberOfLines = 0
        label.font = label.font.withSize(16)

        addSubview(label)
        return label
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        isUserInteractionEnabled = true
        if let bundleVerson = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            version = bundleVerson
        }
        appConfigVersionLabel.text = "\(Config.appConfiguration), \(String(describing: version))"
    }

}
