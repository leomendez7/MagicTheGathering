//
//  FetchCardListRepository.swift
//
//
//  Created by Leonardo Mendez on 9/04/24.
//

import Foundation
import Domain

public class FetchCardListRepository: FetchCardsListRepositoryProtocol {
    
    let dataSource: FetchCardsListDataSource
    
    public init(dataSource: FetchCardsListDataSource) {
        self.dataSource = dataSource
    }
    
    public func fetchCardsList() async throws -> [Card] {
        return try await dataSource.fetchCardsList()
    }
    
}
