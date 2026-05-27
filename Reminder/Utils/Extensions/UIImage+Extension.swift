//
//  UIImage+Extension.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 27/05/26.
//

import Foundation
import UIKit

extension UIImage {
    func toJPEGData(compressionQuality: CGFloat = 0.8) -> Data? {
        jpegData(compressionQuality: compressionQuality)
    }

    func toPNGData() -> Data? {
        pngData()
    }
}
