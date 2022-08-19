//
//  ViewController.swift
//  BirthdayApp
//
//  Created by Mehmed on 8/19/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadFeed()
    }

    private func loadFeed() {
        let vc = FeedViewController()
        self.navigationController?.setViewControllers([vc], animated: true)
    }
}

