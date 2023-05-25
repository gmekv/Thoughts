//
//  ViewController.swift
//  Thoughts
//
//  Created by Giorgi Meqvabishvili on 23.05.23.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(didtapSignout))
         
    }
   @objc private func didtapSignout() {
        
    }

}

