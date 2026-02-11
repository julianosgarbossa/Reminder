//
//  String+Ext.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 10/02/26.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
