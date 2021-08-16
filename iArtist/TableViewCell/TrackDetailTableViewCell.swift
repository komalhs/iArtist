//
//  TrackDetailTableViewCell.swift
//  iArtist
//
//  Created by Komal Sanghani on 8/15/21.
//

import UIKit

class TrackDetailTableViewCell: UITableViewCell {

    static let reuseID  = "TrackDetailTableViewCell"
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var trackLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var trackDetailView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        trackDetailView.setBorderAndCorner()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func set(track: TrackDetails) {
        artistLabel.text = track.artistName
        trackLabel.text = track.trackName
        genreLabel.text = "Genre: \(track.primaryGenreName)"
        priceLabel.text = "Price: \(track.trackPrice) \(track.currency)"
        releaseDateLabel.text = "Released On: \(track.releaseDate.convertToDisplayFormat())"
    }

}
