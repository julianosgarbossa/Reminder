//
//  Icon.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 26/05/26.
//

import Foundation
import UIKit

struct Icon {
    
    struct Name {
        static let star = "star"
        static let logOut = "logOut"
    }
    
    static func image(named name: String, size: CGSize = CGSize(width: 25, height: 25)) -> UIImage? {
        guard let image = UIImage(named: name) else { return nil }
        let renderer = UIGraphicsImageRenderer(size: size)
        let resizedImage = renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: size))
        }
        return resizedImage.withRenderingMode(.alwaysTemplate)
    }
}
