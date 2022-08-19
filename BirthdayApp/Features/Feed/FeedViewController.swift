//
//  FeedViewController.swift
//  BirthdayApp
//
//  Created by Mehmed on 8/19/22.
//

import UIKit

class FeedViewController: UIViewController {
    @IBOutlet weak var mainHeaderTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel = FeedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarHidden()
        setScreen()
        setCollection()
        bindViewModel()
    }
    
    private func bindViewModel() {
        
    }
    
    private func setScreen() {
        mainHeaderTitle.text = "Birthdays"
        mainHeaderTitle.textColor = Colors.primaryBlack
        mainHeaderTitle.font = .boldSystemFont(ofSize: 20)
    }
    
    private func setCollection() {
        collectionView.registerCell(ofType: FeedItemViewCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout
    }
}

extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(ofType: FeedItemViewCell.self, indexPath: indexPath)
        return cell
    }
}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 66)
    }
}
