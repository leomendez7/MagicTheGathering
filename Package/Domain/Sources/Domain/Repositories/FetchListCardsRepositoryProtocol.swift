//
//  FetchListCardsRepositoryProtocol.swift
//
//
//  Created by Leonardo Mendez on 9/04/24.
//

import Foundation

public protocol FetchCardsListRepositoryProtocol {
    
    func fetchCardsList() async throws -> [Card]
    
}
