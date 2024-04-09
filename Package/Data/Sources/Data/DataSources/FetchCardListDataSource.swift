//
//  FetchCardListDataSource.swift
//
//
//  Created by Leonardo Mendez on 9/04/24.
//

import Foundation
import Domain
import Alamofire
import Shared

public class FetchCardsListDataSource: FetchCardsListRepositoryProtocol {
    
    enum Errors: Error {
        case couldNotDecodeUser
        case couldNotCreateDecoder
    }
    
    let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    
    public func fetchCardsList() async throws -> [Domain.Card] {
        let path = "cards"
        let response: DataResponse<CardData, AFError> = await apiClient.get(path)
        let result = response.result
        switch result {
        case .success(let response):
            AppLogger.debug(response.convertToJSON())
            Default.save(cardData: response)
            return response.cards
        case .failure(let error):
            AppLogger.error(error.localizedDescription, context: error)
            throw error
        }
    }
    
}
