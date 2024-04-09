//
//  CardListView.swift
//
//
//  Created by Leonardo Mendez on 9/04/24.
//

import SwiftUI
import Domain

struct CardListView: View {
    
    @EnvironmentObject var store: Store
    @StateObject var viewModel: CardsListViewModel
    @State private var selectedCard: Card? = nil
    
    var body: some View {
        NavigationStack(path: $store.details) {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.cards.indices, id: \.self) { index in
                        CardCellView(name: viewModel.cards[index].name, imageUrl: viewModel.cards[index].imageURL ?? "")
                            .padding(.horizontal, 16)
                            .onTapGesture {
                                selectedCard = viewModel.cards[index]
                                store.details.append("details")
                            }
                    }
                }
                .navigationDestination(for: String.self,
                                       destination: {
                    route in
                    switch route {
                    case "details":
                        CardDetailsView(
                            imageURL: selectedCard?.imageURL ?? "",
                            name: selectedCard?.name ?? "",
                            text: selectedCard?.text ?? ""
                        )
                    default:
                        EmptyView()
                    }
                })
            }
            .navigationTitle("List of Cards")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                Task {
                    await viewModel.fetchCards()
                }
            }
        }
    }
    
}

@available(iOS 13.0, *)
#Preview {
    CardListView(viewModel: Constants.cardListViewModel)
        .environmentObject(Store())
}
