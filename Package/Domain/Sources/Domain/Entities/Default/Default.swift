//
//  Default.swift
//
//
//  Created by Leonardo Mendez on 9/04/24.
//

import Foundation

public class Default: ObservableObject {
    
    public enum Key: String {
        case cards
    }
    
    public static func destroySession(){
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: Key.cards.rawValue)
    }
    
    public init() { }

}
