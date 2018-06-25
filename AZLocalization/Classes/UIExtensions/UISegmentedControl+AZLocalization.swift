//
//  UISegmentedControl+AZLocalization.swift
//  AZLocalization
//
//  Created by Jean-François GRANG on 14/05/2018.
//

extension UISegmentedControl {

	@IBInspectable var localized: Bool {
		get { return false }
		set {
			for index in 0 ..< numberOfSegments {
				if let title = titleForSegment(at: index) {
					setTitle(loc(title), forSegmentAt: index)
				}
			}
		}
	}

	@IBInspectable var uppercasedTitles: Bool {
		get { return false }
		set {
			for index in 0 ..< numberOfSegments {
				if let title = titleForSegment(at: index) {
					setTitle(title.uppercased(), forSegmentAt: index)
				}
			}
		}
	}

}
