//
//  PresentationView.swift
//
//
//  Created by Leonardo Mendez on 9/04/24.
//

import SwiftUI

public struct PresentationView: View {
    
    @State public var isSheetPresented: Bool = false
    
    public var isSheetPresentedValue: Bool {
        get { isSheetPresented }
        set { isSheetPresented = newValue }
    }
    
    public init(){ }
    
    public var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 8) {
                    Text("Name: ")
                        .typography(custom: FontManager.bold, size: 16)
                    Text("Leonardo Mendez Ovalle")
                        .typography(custom: FontManager.book, size: 16)
                }
                HStack(spacing: 8) {
                    Text("Phone: ")
                        .typography(custom: FontManager.bold, size: 16)
                    Text("+57 3016228900")
                        .typography(custom: FontManager.book, size: 16)
                }
                HStack(spacing: 8) {
                    Text("email: ")
                        .typography(custom: FontManager.bold, size: 16)
                    Text("leo.mendez.9@outlook.com")
                        .typography(custom: FontManager.book, size: 16)
                        
                }
                HStack(spacing: 8) {
                    Text("End date: ")
                        .typography(custom: FontManager.bold, size: 16)
                    Text("10 April 2024")
                        .typography(custom: FontManager.book, size: 16)
                }
                VStack {
                    CustomButtonView(action: {
                        isSheetPresented.toggle()
                    }, text: "Continue", fontSize: 16, background: Color(named: .white), borderColor: Color(named: .blue))
                }
                .padding(.top, 20)
            }
            Spacer()
        }
        .padding(.horizontal, 16)
        .fullScreenCover(isPresented: $isSheetPresented) {
            CardListView(viewModel: Constants.cardListViewModel)
                .background(Color.white)
        }
    }
    
}

#Preview {
    PresentationView()
}
