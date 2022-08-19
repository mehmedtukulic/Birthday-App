//
//  UICollectionView+Extension.swift
//  BirthdayApp
//
//  Created by Mehmed on 8/19/22.
//

import Foundation
import UIKit

extension UICollectionView {
    func registerCell<T>(ofType: T.Type) where T: UICollectionViewCell {
        register(UINib(nibName: T.identifier, bundle: nil), forCellWithReuseIdentifier: T.identifier)
    }
    
    // Dequeue a UICollectionViewCell which has the same nib name and identifier as its class name.
    public func dequeueReusableCell<T>(ofType: T.Type, indexPath: IndexPath) -> T where T: UICollectionViewCell {
        return dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as! T
    }
}
