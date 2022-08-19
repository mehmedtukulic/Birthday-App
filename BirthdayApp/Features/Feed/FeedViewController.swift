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
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private let cellHeight: CGFloat = 66
    private let viewModel = FeedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarHidden()
        setScreen()
        setCollection()
        bindViewModel()
    }
    
    private func bindViewModel() {
        viewModel.isLoadingItems.bind { [weak self] loading in
            guard let self = self else { return }
            
            if loading {
                self.startLoader()
            } else {
                self.stopLoader()
                self.collectionView.reloadData()
            }
        }
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
    
    private func startLoader() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.startAnimating()
    }
    
    private func stopLoader() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
}

// MARK: - Collection handlings

extension FeedViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.feedItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(ofType: FeedItemViewCell.self, indexPath: indexPath)
        cell.configure(person: viewModel.feedItems[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let person = viewModel.feedItems[indexPath.row]
        navigateToDetailsScreen(with: person)
    }
}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: cellHeight)
    }
}

// MARK: - Navigation

extension FeedViewController {
    private func navigateToDetailsScreen(with person: Person) {
        let vc = PersonDetailsViewController()
        vc.setup(person: person)
        push(vc)
    }
}
