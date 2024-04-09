//
//  Store.swift
//
//
//  Created by Leonardo Mendez on 9/04/24.
//

import SwiftUI

public class Store: ObservableObject {
    
    @Published public var details = NavigationPath()

    public static var storeDefault = Store()
    
    public init(details: NavigationPath = NavigationPath()) {
        self.details = details
    }
    
    public func resetChooseStudent() {
        details = NavigationPath()
    }
    
}
