//
//  UIViewController+AZLocalization.swift
//  AZLocalization
//
//  Created by Jean-François GRANG on 14/05/2018.
//

extension UIViewController {

	@IBInspectable var localizedTitle: String {
		get { return "" }
		set {
			title = loc(newValue)
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
