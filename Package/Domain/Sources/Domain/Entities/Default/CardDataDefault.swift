//
//  File.swift
//  
//
//  Created by Leonardo Mendez on 9/04/24.
//

import Foundation

extension Default {
    
    public static var cardData: CardData? { return CardData.current }
    
    public static func save(cardData: CardData) {
        guard let encoded = try? JSONEncoder().encode(cardData) else { return }
        UserDefaults.standard.set(encoded, forKey: Default.Key.cards.rawValue)
    }
    
}

@available(iOS 13.0, *)
public extension CardData {
    
    static var current: CardData? {
        let defaults = UserDefaults.standard
        if let savedCardData = defaults.object(forKey: Default.Key.cards.rawValue) as? Data {
            let decoder = JSONDecoder()
            return try? decoder.decode(CardData.self, from: savedCardData)
        }
        return nil
    }
    
}
