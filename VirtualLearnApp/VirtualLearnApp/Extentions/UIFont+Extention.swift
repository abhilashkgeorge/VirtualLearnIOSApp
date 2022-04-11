//
//  UIFont+Extention.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 10/04/22.
//

import Foundation
import UIKit



extension UIFont {

    static func bikoBold(size: CGFloat) -> UIFont {
      guard let customFont = UIFont(name: "biko-bold", size: size) else {
        return UIFont.systemFont(ofSize: size)
      }
      return customFont
    }
    
    static func proximaNovaRegular(size: CGFloat) -> UIFont {
      guard let customFont = UIFont(name: "ProximaNova-Regular", size: size) else {
        return UIFont.systemFont(ofSize: size)
      }
      return customFont
    }
    
    static func proximaNovaSemiBold(size: CGFloat) -> UIFont {
      guard let customFont = UIFont(name: "ProximaNova-Regular", size: size) else {
        return UIFont.systemFont(ofSize: size)
      }
      return customFont
    }
    
    static func proximaNovaBold(size: CGFloat) -> UIFont {
      guard let customFont = UIFont(name: "ProximaNova-Bold", size: size) else {
        return UIFont.systemFont(ofSize: size)
      }
      return customFont
    }
    
//    static func proximaNovaRegular(size: CGFloat) -> UIFont {
//      guard let customFont = UIFont(name: "ProximaNova-Regular", size: size) else {
//        return UIFont.systemFont(ofSize: size)
//      }
//      return customFont
//    }
}
