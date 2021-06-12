//
//  circleImage.swift
//  Landmarks
//
//  Created by Дмитрий Жучков on 10.06.2021.
//

import UIKit
@IBDesignable
final class CircleImageView: UIImageView {

  override func layoutSubviews() {
    super.layoutSubviews()
    self.setup()
  }
  
  // MARK: Circle image settings
  func setup(){
    self.layer.cornerRadius = self.frame.height/2
    self.layer.borderColor = UIColor.white.cgColor
    self.contentMode = .scaleToFill
    self.layer.borderWidth = 4
    self.layer.masksToBounds = true
    
  }
  
}
