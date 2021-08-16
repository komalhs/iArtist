//
//  SearchArtistViewController.swift
//  iArtist
//
//  Created by Komal Sanghani on 8/15/21.
//

import UIKit

class SearchArtistViewController: UIViewController, Storyboarded, UITextFieldDelegate {

    // MARK: UI Variable and Class Variable
    
    @IBOutlet weak var artistNameTextField: UITextField!
    @IBOutlet weak var artistFieldContainer: UIView!
    weak var coordinator: MainCoordinator?
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        artistFieldContainer.setBorderAndCorner()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: Button Click Event
    
    @IBAction func onSearchArtistClick(){
        
        artistNameTextField.resignFirstResponder()
        guard let artistName = artistNameTextField.text else {
            return
        }
        if artistName.isEmpty {
            presentAlertOnMainThread(title: AlertMessage.oopsTitle, message: AlertMessage.missingArtistName)
            return
        }
        coordinator?.goToTracksViewController(artistName: artistName)
    }
    
    // MARK: TextField Delegate Method
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        artistNameTextField.resignFirstResponder()
        return true
    }
}
