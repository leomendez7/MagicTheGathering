//
//  FetchListCardsUseCase.swift
//
//
//  Created by Leonardo Mendez on 9/04/24.
//

import Foundation

public class FetchCardsListUseCase: UseCaseProtocol {
    
    let repository: FetchCardsListRepositoryProtocol
    
    public init(repository: FetchCardsListRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(requestValue: String) async throws -> [Card] {
        return try await repository.fetchCardsList()
    }
    
}
