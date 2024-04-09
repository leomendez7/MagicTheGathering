//
//  PresentationView.swift
//
//
//  Created by Leonardo Mendez on 9/04/24.
//

import SwiftUI

@available(iOS 13.0.0, *)
public struct PresentationView: View {
    
    public init(){ }
    
    public var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 8) {
                    Text("Name: ")
                        .typography(custom: FontManager.bold, size: 16)
                    Text("Leonardo Mendez Ovalle")
                        .typography(custom: FontManager.medium, size: 16)
                }
                HStack(spacing: 8) {
                    Text("Phone: ")
                        .typography(custom: FontManager.bold, size: 16)
                    Text("+57 3016228900")
                        .typography(custom: FontManager.medium, size: 16)
                }
                HStack(spacing: 8) {
                    Text("email: ")
                        .typography(custom: FontManager.bold, size: 16)
                    Text("leo.mendez.9@outlook.com")
                        .typography(custom: FontManager.medium, size: 16)
                        .foregroundColor(fromAssets: .black)
                }
                HStack(spacing: 8) {
                    Text("End date: ")
                        .typography(custom: FontManager.bold, size: 16)
                    Text("10 April 2024")
                        .typography(custom: FontManager.medium, size: 16)
                }
                VStack {
                    CustomButtonView(action: {
                        
                    }, text: "Continue", fontSize: 16, background: Color.white, borderColor: Color(named: .blue))
                }
                .padding(.top, 20)
            }
            Spacer()
        }
        .padding(.horizontal, 16)
    }
    
}

@available(iOS 13.0.0, *)
#Preview {
    PresentationView()
}
