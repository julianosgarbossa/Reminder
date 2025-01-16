//
//  String+Ext.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 13/01/25.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
