//
//  UIBarButtonItem+AZLocalization.swift
//  AZLocalization
//
//  Created by Jean-François GRANG on 04/09/2020.
//

import UIKit

extension UIBarButtonItem {

	@IBInspectable var localizedText: String? {
		get { return "" }
		set {
			if let newValue = newValue {
				title = loc(newValue)
			}
		}
	}

	@IBInspectable var uppercasedText: Bool {
		get { return false }
		set {
			if newValue {
				title = title?.uppercased()
			}
		}
	}
}
