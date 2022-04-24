//
//  UIButton+Extention.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 23/04/22.
//

import Foundation
import UIKit

extension UIButton {
    func imageWith(color:UIColor, for: UIControl.State) {
        if let imageForState = self.image(for: state) {
            self.image(for: .normal)?.withRenderingMode(.alwaysTemplate)
            let colorizedImage = imageForState.image(withTintColor: color)
            self.setImage(colorizedImage, for: state)
        }
    }
}
