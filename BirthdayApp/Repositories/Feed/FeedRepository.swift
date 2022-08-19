//
//  FeedRepository.swift
//  BirthdayApp
//
//  Created by Mehmed on 8/19/22.
//

import Foundation

protocol FeedRepositoryProtocol {
    func getFeed(success: @escaping (FeedResponse) -> Void, failure: @escaping (String)  -> Void)
}

class FeedRepository: FeedRepositoryProtocol {
    private var apiClient: APIProtocol
    
    init(apiClient: APIProtocol = APIClient()) {
        self.apiClient = apiClient
    }
    
    func getFeed(success: @escaping (FeedResponse) -> Void, failure: @escaping (String) -> Void) {
        let request = FeedRequest.getFeed
        apiClient.makeRequest(request) { (response: FeedResponse) in
            success(response)
        } failure: { error in
            print("Error fetching feed: - " + error)
        }

    }
    
}
