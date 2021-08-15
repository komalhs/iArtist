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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSearchArtistClick(){
        
        artistNameTextField.resignFirstResponder()
        coordinator?.goToTracksViewController()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
