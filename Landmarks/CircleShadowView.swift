//
//  CircleImageShadow.swift
//  Landmarks
//
//  Created by Дмитрий Жучков on 10.06.2021.
//

import UIKit

@IBDesignable
final class CircleShadowView: UIView {

  override func layoutSubviews() {
    super.layoutSubviews()
    self.setup()
  }
    
  // MARK: Shadow settings
  func setup(){
    self.clipsToBounds = false
    self.layer.masksToBounds = false
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowRadius = 10
    self.layer.shadowOpacity = 0.33
    self.layer.shadowOffset = .zero
    self.layer.shadowPath =  UIBezierPath(roundedRect: bounds, cornerRadius: self.frame.height/2).cgPath
  }
}
