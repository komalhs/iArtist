//
//  Coordinator.swift
//  iArtist
//
//  Created by Komal Sanghani on 8/15/21.
//

import Foundation
import UIKit

protocol Coordinator {
    
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
}
