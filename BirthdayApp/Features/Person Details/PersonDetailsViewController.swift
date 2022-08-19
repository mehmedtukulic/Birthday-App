//
//  PersonDetailsViewController.swift
//  BirthdayApp
//
//  Created by Mehmed on 8/19/22.
//

import UIKit

class PersonDetailsViewController: UIViewController {
    @IBOutlet weak var initialsView: UIView!
    @IBOutlet weak var initialsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearsLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    private var viewModel: PersonDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setScreen()
    }
    
    func setup(person: Person) {
        viewModel = PersonDetailsViewModel(person: person)
    }
    
    private func setScreen() {
        initialsView.layer.cornerRadius = initialsView.frame.height / 2
        initialsView.backgroundColor = Colors.backgroundGray
        
        initialsLabel.text = viewModel.personInitials
        initialsLabel.textColor = Colors.primaryBlack
        initialsLabel.font = .systemFont(ofSize: 50, weight: .bold)
        
        nameLabel.text = viewModel.personName
        nameLabel.textColor = Colors.primaryBlack
        nameLabel.font = .systemFont(ofSize: 32, weight: .bold)
        
        yearsLabel.text = viewModel.personYears
        yearsLabel.textColor = Colors.textGray
        yearsLabel.font = .systemFont(ofSize: 16, weight: .regular)
        
        backButton.setTitle("GO BACK", for: .normal)
        backButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .semibold)
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = Colors.primaryBlack
        backButton.layer.cornerRadius = 8
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        pop()
    }
    
}
