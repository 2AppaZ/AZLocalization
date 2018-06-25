//
//  UITextField+AZLocalization.swift
//  AZLocalization
//
//  Created by Jean-François GRANG on 14/05/2018.
//

public func loc(_ textToTranslate: String, comment: String = "") -> String {
	return NSLocalizedString(textToTranslate, comment: comment)
}
