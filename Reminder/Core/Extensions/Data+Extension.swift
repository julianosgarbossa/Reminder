//
//  Data+Extension.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 27/05/26.
//

import Foundation
import UIKit

extension Data {
    func toUIImage() -> UIImage? {
        UIImage(data: self)
    }
}
