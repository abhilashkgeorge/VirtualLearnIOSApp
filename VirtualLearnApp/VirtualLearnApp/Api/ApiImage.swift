//
//  ApiImage.swift
//  VirtualLearnApp
//
//  Created by Anushree on 19/04/22.
//

import Foundation
import UIKit

class ApiImage {
    
    func getImgFromApi(url: String, completion: @escaping (_ image: UIImage) -> Void ) {
        
        guard let imgURL = URL(string: url) else {
            fatalError("image error")
        }
        
        if let data = try? Data(contentsOf: imgURL) {
            
            if let image = UIImage(data: data) {
                completion(image)
            }
        }
    }
}
