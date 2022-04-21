//
//  ApiImage.swift
//  VirtualLearnApp
//
//  Created by Anushree on 19/04/22.
//

import Foundation
import UIKit

class ApiImage {
    
    private let cache = NSCache<NSString, UIImage>()
    
    func getImgFromApi(url: String, completion: @escaping (_ image: UIImage) -> Void ) {
        
        if let image = cache.object(forKey: url as NSString) {
                    completion(image)
                    return
                }
        
        guard let imgURL = URL(string: url) else {
            fatalError("image error")
        }
        
        if let data = try? Data(contentsOf: imgURL) {
            
            if let image = UIImage(data: data) {
                self.cache.setObject(image, forKey: url as NSString)
                completion(image)
            }
        }
    }
}
