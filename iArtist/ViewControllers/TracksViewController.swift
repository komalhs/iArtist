//
//  TracksViewController.swift
//  iArtist
//
//  Created by Komal Sanghani on 8/15/21.
//

import UIKit

class TracksViewController: UIViewController, Storyboarded, UITableViewDataSource, UITableViewDelegate {

    // MARK: UI Variable and Class Variable
    
    var artistName: String?
    var tracksArray: [TrackDetails] = []
    @IBOutlet weak var tracksTableView: UITableView!

    // MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        getTracksData()
    }
    
    // MARK: Fetch Data from Server
    
    func getTracksData() {
        showLoadingView()
        guard let artistName = self.artistName else { return }
        NetworkManager.shared.getTrackList(for: artistName) { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result {
            case .success(let trackData):
                if trackData.trackCount == 0 {
                    self.presentAlertOnMainThreadWithPopVC(title: AlertMessage.oopsTitle, message: AlertMessage.emptyList, buttonTitle: AlertMessage.newSearch)
                }
                self.tracksArray = trackData.trackList
                DispatchQueue.main.async {
                    self.tracksTableView.reloadData()
                }
            case .failure(let error):
                self.presentAlertOnMainThreadWithPopVC(title: AlertMessage.oopsTitle, message: error.rawValue, buttonTitle: AlertMessage.takeBack)
            }
        }
    }
    
    // MARK: TableView Datasource Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tracksArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrackDetailTableViewCell.reuseID) as! TrackDetailTableViewCell
        let track = tracksArray[indexPath.row]
        cell.set(track: track)
        return cell
    }
}

enum AlertMessage {
    static let oopsTitle = "Ooops"
    static let emptyList = "This search did not return any results. Try with a new Search"
    static let newSearch = "New Search"
    static let takeBack = "Take me Back"
    static let missingArtistName = "Please enter artist name"
}
