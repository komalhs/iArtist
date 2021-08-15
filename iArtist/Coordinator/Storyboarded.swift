//
//  Storyboarded.swift
//  iArtist
//
//  Created by Komal Sanghani on 8/15/21.
//

import Foundation
import UIKit

protocol Storyboarded  {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate() -> Self {
        
        let fullName = NSStringFromClass(self)
        // this splits fullName by the dot and uses everything after, giving ViewController's name. Eg. fullName = iArtist.SearchArtistViewController, className = SearchArtistViewController
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        // instantiate a view controller with that identifier, and force cast as the type that was requested
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
