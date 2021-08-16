//
//  SearchArtistViewController.swift
//  iArtist
//
//  Created by Komal Sanghani on 8/15/21.
//

import UIKit

class SearchArtistViewController: UIViewController, Storyboarded, UITextFieldDelegate {

    @IBOutlet weak var artistNameTextField: UITextField!
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        artistNameTextField.setBorderAndCorner()
    }
    
    @IBAction func onSearchArtistClick(){
        
        artistNameTextField.resignFirstResponder()
        guard let artistName = artistNameTextField.text else {
            return
        }
        coordinator?.goToTracksViewController(artistName: artistName)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        artistNameTextField.resignFirstResponder()
        return true
    }

}

extension UIView {
    
    func setBorderAndCorner() {
        
        let borderColor = UIColor(named: "borderColor")
        self.layer.borderWidth = 1
        self.layer.borderColor = borderColor?.cgColor
        self.layer.cornerRadius = 5
    }
}
