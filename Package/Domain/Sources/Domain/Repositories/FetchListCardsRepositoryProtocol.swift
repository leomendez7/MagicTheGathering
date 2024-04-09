//
//  FetchListCardsRepositoryProtocol.swift
//
//
//  Created by Leonardo Mendez on 9/04/24.
//

import Foundation

public protocol FetchListCardsRepositoryProtocol {
    
    func fetchListCards() async throws -> [Card]
    
}
