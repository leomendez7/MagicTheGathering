//
//  CardCellView.swift
//
//
//  Created by Leonardo Mendez on 9/04/24.
//

import SwiftUI
import Kingfisher

struct CardCellView: View {
    
    @State var name: String
    @State var imageUrl: String
    
    var body: some View {
        HStack {
            KFImage.url(URL(string: imageUrl)).placeholder {
                Rectangle()
                    .fill(Color(named: .black))
                    .frame(width: 35, height: 50)
            }
            .resizable()
            .frame(width: 35, height: 50)
            HStack {
                Text(name)
                    .typography(custom: FontManager.book, size: 20)
                    .foregroundColor(fromAssets: .black2)
                Spacer()
            }
        }
        .padding(.horizontal, 25)
        .frame(height: 91)
        .frame(maxWidth: .infinity)
        .background(Color(named: .lightGray))
        .cornerRadius(20)
    }
    
}

#Preview {
    CardCellView(name: "Ancestor's Chosen", imageUrl: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130550&type=card")
}
