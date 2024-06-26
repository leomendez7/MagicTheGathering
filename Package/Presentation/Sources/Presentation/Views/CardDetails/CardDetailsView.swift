//
//  CardDetailsView.swift
//  
//
//  Created by Leonardo Mendez on 9/04/24.
//

import SwiftUI
import Domain
import Kingfisher

struct CardDetailsView: View {
    
    @EnvironmentObject var store: Store
    @State var imageURL: String
    @State var name: String
    @State var text: String
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                KFImage.url(URL(string: imageURL)).placeholder {
                    Rectangle()
                        .fill(Color(named: .black))
                        .frame(width: 220, height: 300)
                }
                Text(name)
                    .typography(custom: FontManager.bold, size: 25)
                    .foregroundColor(fromAssets: .black2)
                VStack(alignment: .trailing) {
                    Text(text)
                        .typography(custom: FontManager.book, size: 20)
                        .foregroundColor(fromAssets: .black2)
                }
                Spacer()
            }
            .padding(.top, 15)
            .padding(.horizontal, 25)
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackNavigationButtonView(action: {
            store.details.removeLast()
        }, image: Assets.Icons.blackArrowLeft.rawValue, color: Color(named: .black)))
    }
    
}

#Preview {
    CardDetailsView(
        imageURL: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130550&type=card",
        name: "Ancestor's Chosen",
        text: "First strike (This creature deals combat damage before creatures without first strike.)\nWhen Ancestor's Chosen enters the battlefield, you gain 1 life for each card in your graveyard."
    )
        .environmentObject(Store())
}
