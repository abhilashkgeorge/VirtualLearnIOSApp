//
//  UITableView+Extention.swift
//  VirtualLearnApp
//
//  Created by Abhilash k George on 25/04/22.
//

import UIKit

class SelfSizedTableView: UITableView {
  var maxHeight: CGFloat = UIScreen.main.bounds.size.height
  
  override func reloadData() {
    
    super.reloadData()
    self.invalidateIntrinsicContentSize()
    self.layoutIfNeeded()
  }
  
    override var intrinsicContentSize: CGSize {
       setNeedsLayout()
       layoutIfNeeded()
       let height = min(contentSize.height, maxHeight)
       return CGSize(width: contentSize.width, height: height)
    }

}
