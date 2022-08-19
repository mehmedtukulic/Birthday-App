//
//  Observable.swift
//  BirthdayApp
//
//  Created by Mehmed on 8/19/22.
//

import Foundation

//NOTE: Class which converts variables to observables

class Observable<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
