//
//  Colors.swift
//
//
//  Created by Leonardo Mendez on 9/04/24.
//

import SwiftUI

public enum Colors {
    
    case neutral
    case black
    case blue
    case gray
    case custom(hex: UInt, alpha: Double?)
    
    @available(iOS 13.0, *)
    var colorValue: Color {
        switch self {
        case .neutral:
            return Color("neutral", bundle: .module)
            
        case .black:
            return Color("black", bundle: .module)
            
        case .blue:
            return Color("blue", bundle: .module)
            
        case .gray:
            return Color("gray", bundle: .module)
            
        case .custom(let hex, let alpha):
            return Color(hex: hex, alpha: alpha ?? 1.0)
        
        }
    }
    
}

@available(iOS 13.0, *)
extension Color {
    public init(named: Colors) {
        self = named.colorValue
    }
    
    public init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
