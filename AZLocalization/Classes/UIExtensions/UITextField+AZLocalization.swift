//
//  UITextField+AZLocalization.swift
//  AZLocalization
//
//  Created by Jean-François GRANG on 14/05/2018.
//

extension UITextField {

	@IBInspectable var localizedPlaceholder: String? {
		get { return "" }
		set {
			if let newValue = newValue {
				placeholder = loc(newValue)
			}
		}
	}

	@IBInspectable var uppercasedLocalizedPlaceholder: Bool {
		get { return false }
		set {
			if newValue {
				placeholder = placeholder?.uppercased()
			}
		}
	}

	@IBInspectable var localizedText: String? {
		get { return "" }
		set {
			if let newValue = newValue {
				text = loc(newValue)
			}
		}
	}

	@IBInspectable var uppercasedLocalizedText: Bool {
		get { return false }
		set {
			if newValue {
				text = text?.uppercased()
			}
		}
	}

}
