//
//  UILabel+AZLocalization.swift
//  AZLocalization
//
//  Created by Jean-François GRANG on 14/05/2018.
//

extension UILabel {

	@IBInspectable var localizedText: String? {
		get { return "" }
		set {
			if let newValue = newValue {
				text = loc(newValue)
			}
		}
	}

	@IBInspectable var uppercasedText: Bool {
		get { return false }
		set {
			if newValue {
				text = text?.uppercased()
			}
		}
	}

}
