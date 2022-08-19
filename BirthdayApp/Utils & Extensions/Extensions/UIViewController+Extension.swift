//
//  UIViewController+Extension.swift
//  BirthdayApp
//
//  Created by Mehmed on 8/19/22.
//

import Foundation
import UIKit

extension UIViewController {
    func push(_ viewController: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    @objc func pop() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension UIViewController {
    func setNavigationBarHidden(_ isHidden: Bool = true) {
        self.navigationController?.navigationBar.isHidden = isHidden
    }
}
