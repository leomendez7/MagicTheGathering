//
//  File.swift
//  
//
//  Created by Leonardo Mendez on 9/04/24.
//

import Foundation
import Domain

public class CardsListViewModel: BaseViewModel<FetchCardsListUseCase>, ObservableObject {
    
    var store: Store
    @Published var cards: [Card] = []
    @Published var isrequestError: Bool = false
    
    public init(useCase: FetchCardsListUseCase, store: Store) {
        self.store = store
        super.init(useCase: useCase)
    }
    
    func fetchCards() async {
        do {
            guard let cards = Default.cardData else {
                let defaults = UserDefaults.standard
                defaults.removeObject(forKey: Default.Key.cards.rawValue)
                let response = try await useCase.execute(requestValue: "")
                DispatchQueue.main.async {
                    response.forEach { card in
                        self.cards.append(card)
                    }
                }
                return
            }
            DispatchQueue.main.async {
                cards.cards.forEach { card in
                    self.cards.append(card)
                }
            }
        } catch {
            DispatchQueue.main.async {
                self.isrequestError.toggle()
            }
            print(error.localizedDescription)
        }
    }
    
}
