//
//  FeedViewModel.swift
//  BirthdayApp
//
//  Created by Mehmed on 8/19/22.
//

import Foundation

class FeedViewModel {
    var isLoadingItems: Observable<Bool> = Observable(false)
    var feedItems : Observable<[Person]> = Observable([])
    var errorMessage: Observable<String> = Observable(String())

    private let feedRepository: FeedRepositoryProtocol
    
    init(feedRepository: FeedRepositoryProtocol = FeedRepository()) {
        self.feedRepository = feedRepository
        getFeed()
    }
    
    private func getFeed() {
        isLoadingItems.value = true
        
        feedRepository.getFeed { [weak self] feedResponse in
            guard let self = self else { return }
            
            self.feedItems.value = feedResponse.results
            self.isLoadingItems.value = false
            
        } failure: { [weak self] error in
            guard let self = self else { return }
            
            self.errorMessage.value = error
            self.isLoadingItems.value = false
        }
    }
}
