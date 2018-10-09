//
//  UIButton+AZLocalization.swift
//  AZLocalization
//
//  Created by Jean-François GRANG on 14/05/2018.
//

extension UIButton {

	@IBInspectable var defaultLocalizedTitle: String? {
		get { return "" }
		set {
			if let newValue = newValue {
				setTitle(loc(newValue), for: .normal)
			}
		}
	}

	@IBInspectable var highlightedLocalizedTitle: String? {
		get { return "" }
		set {
			if let newValue = newValue {
				setTitle(loc(newValue), for: .highlighted)
			}
		}
	}

	@IBInspectable var selectedLocalizedTitle: String? {
		get { return "" }
		set {
			if let newValue = newValue {
				setTitle(loc(newValue), for: .selected)
			}
		}
	}

	@IBInspectable var disabledLocalizedTitle: String? {
		get { return "" }
		set {
			if let newValue = newValue {
				setTitle(loc(newValue), for: .disabled)
			}
		}
	}

	@IBInspectable var uppercasedTitles: Bool {
		get { return false }
		set {
			if newValue {
				[UIControl.State.normal, .highlighted, .selected, .disabled].forEach({
					let lowerCase = title(for: $0)
					setTitle(lowerCase?.uppercased(), for: $0)
				})
			}
		}
	}

}
