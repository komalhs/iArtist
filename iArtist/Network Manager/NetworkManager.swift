//
//  NetworkManager.swift
//  iArtist
//
//  Created by Komal Sanghani on 8/15/21.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseURL = "https://itunes.apple.com/"

    private init() { }
    
    /**
     Converts date into display format
     - Parameter artistName: String input given by user to searh artist's track
     - Parameter completed: completion handler returns result. Tracks if success, NetworkError if failure
     */
    func getTrackList(for artistName: String, completed: @escaping (Result<Tracks, NetworkError>) -> Void) {
        let endpoint = baseURL + "search?term=\(artistName)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidArtistName))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let tracks = try decoder.decode(Tracks.self, from: data)
                completed(.success(tracks))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}


enum NetworkError: String, Error {
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case invalidArtistName = "This artist name created an invalid request. Please try again."
}
