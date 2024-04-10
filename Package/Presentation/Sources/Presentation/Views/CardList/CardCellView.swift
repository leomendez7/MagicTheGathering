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
    @State var type: String
    @State var imageUrl: String
    
    var body: some View {
        HStack {
            KFImage.url(URL(string: imageUrl)).placeholder { progress in
                if imageUrl.isEmpty {
                    Rectangle()
                        .fill(Color(named: .black))
                        .frame(width: 35, height: 50)
                } else {
                    ProgressView()
                }
            }
            .resizable()
            .frame(width: 35, height: 50)
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .typography(custom: FontManager.book, size: 20)
                        .foregroundColor(fromAssets: .black2)
                    Text(type)
                        .typography(custom: FontManager.book, size: 13)
                        .foregroundColor(fromAssets: .black2)
                }
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
    CardCellView(name: "Ancestor's Chosen", type: "Creature — Human Cleric", imageUrl: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130550&type=card")
}
