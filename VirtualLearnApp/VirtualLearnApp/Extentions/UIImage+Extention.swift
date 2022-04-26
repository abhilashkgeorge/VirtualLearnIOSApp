//
//  UIImage+Extention.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 12/04/22.
//

import Foundation
import UIKit

extension UIImage {
    
    enum AssetImages: String {
        
        case SearchIcon = "icn_search-Search"
        case HamburgerMenu = "icn_hamburgermenu"
        case Course1 = "img_banner1_home"
        case Course2 = "img_banner3_home"
        case Course3 = "img_banner2_home"
        case Course4 = "img_banner4_home"
        
    }
    
    public func image(withTintColor color: UIColor) -> UIImage{
           UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
           let context: CGContext = UIGraphicsGetCurrentContext()!
           context.translateBy(x: 0, y: self.size.height)
           context.scaleBy(x: 1.0, y: -1.0)
           context.setBlendMode(CGBlendMode.normal)
           let rect: CGRect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
           context.clip(to: rect, mask: self.cgImage!)
           color.setFill()
           context.fill(rect)
           let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
           UIGraphicsEndImageContext()
           return newImage
       }
}
