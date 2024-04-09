//
//  CustomButtonView.swift
//
//
//  Created by Leonardo Mendez on 9/04/24.
//

import SwiftUI

@available(iOS 13.0, *)
struct CustomButtonView: View {
    
    var action: () -> Void
    @State var text: String
    @State var fontSize: CGFloat
    @State var background: Color
    @State var foregroundColor: Color?
    @State var borderColor: Color
    
    var body: some View {
        VStack {
            Button(action: {
                action()
            }) {
                HStack() {
                    Text(text)
                        .typography(custom: FontManager.bold, size: fontSize)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 41)
                .padding(.horizontal, 16)
                .foregroundColor(foregroundColor)
                .background(background)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(borderColor, lineWidth: 1)
                )
            }
        }
    }
}

@available(iOS 13.0, *)
#Preview {
    CustomButtonView(action: {}, text: "Test", fontSize: 20, background: Color.white, foregroundColor: Color(named: .blue), borderColor: Color(named: .blue))
}
