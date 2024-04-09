//
//  FetchListCardsUseCase.swift
//
//
//  Created by Leonardo Mendez on 9/04/24.
//

import Foundation

public class FetchListCardsUseCase: UseCaseProtocol {
    
    let repository: FetchListCardsRepositoryProtocol
    
    public init(repository: FetchListCardsRepositoryProtocol) {
        self.repository = repository
    }
    
    public func execute(requestValue: String) async throws -> [Card] {
        return try await repository.fetchListCards()
    }
    
}
