//
//  TracksViewController.swift
//  iArtist
//
//  Created by Komal Sanghani on 8/15/21.
//

import UIKit

class TracksViewController: UIViewController, Storyboarded, UITableViewDataSource, UITableViewDelegate {

    var artistName: String?
    var tracksArray: [TrackDetails] = []
    @IBOutlet weak var tracksTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        getTracksData()
    }
    
    func getTracksData() {
        showLoadingView()
        guard let artistName = self.artistName else { return }
        NetworkManager.shared.getTrackList(for: artistName) { [weak self] result in
            guard let self = self else { return }
            
            self.dismissLoadingView()
            
            switch result {
            case .success(let trackData):
                if trackData.trackCount == 0 {
                    self.presentAlertOnMainThread(title: "Search Result", message: "No tracks forund for this search")
                }
                
                self.tracksArray = trackData.trackList
                print(self.tracksArray)
                DispatchQueue.main.async {
                    self.tracksTableView.reloadData()
                }
            case .failure(let error):
                self.presentAlertOnMainThread(title: "Ooops", message: error.rawValue)
            }
        }
    }

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
