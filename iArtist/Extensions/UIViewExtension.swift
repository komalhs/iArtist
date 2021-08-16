//
//  UIViewExtension.swift
//  iArtist
//
//  Created by Komal Sanghani on 8/15/21.
//

import UIKit

extension UIView {
    
    func setBorderAndCorner() {
        let borderColor = UIColor(named: "borderColor")
        self.layer.borderWidth = 1
        self.layer.borderColor = borderColor?.cgColor
        self.layer.cornerRadius = 5
    }
}
