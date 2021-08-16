//
//  MainCoordinator.swift
//  iArtist
//
//  Created by Komal Sanghani on 8/15/21.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = SearchArtistViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToTracksViewController(artistName: String) {
        let vc = TracksViewController.instantiate()
        vc.artistName = artistName
        navigationController.pushViewController(vc, animated: false)
    }
    
}
