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
        
        if let imgURL = URL(string: url){
            if let data = try? Data(contentsOf: imgURL) {
                
                if let image = UIImage(data: data) {
                    completion(image)
                }
            }
        }
        else {
            completion(#imageLiteral(resourceName: "img_search result2"))
        }
    }
}
