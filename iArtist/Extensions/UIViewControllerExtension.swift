//
//  UIViewControllerExtension.swift
//  iArtist
//
//  Created by Komal Sanghani on 8/15/21.
//

import Foundation
import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
    
    //MARK: Activity Indicator
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8 }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        activityIndicator.startAnimating()
    }
    
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    //MARK: Display AlertView
    
    /**
     This methods displays Alert and goes to previous ViewController on click of button/action
     - Parameter title: title of Alert
     - Parameter message: message displayed on alert
     - Parameter buttonTitle: button text
     */
    func presentAlertOnMainThreadWithPopVC(title: String, message: String, buttonTitle: String = "Ok") {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { action in
                self.navigationController?.popViewController(animated: true)
            }))
            self.present(alert, animated: true)
        }
    }
    
    /**
     This methods displays Alert

     - Parameter title: title of Alert
     - Parameter message: message displayed on alert
     - Parameter buttonTitle: button text
     */
    func presentAlertOnMainThread(title: String, message: String, buttonTitle: String = "Ok") {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
}
