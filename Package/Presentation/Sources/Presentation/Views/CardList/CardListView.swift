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
                        CardCellView(name: viewModel.cards[index].name, type: viewModel.cards[index].type, imageUrl: viewModel.cards[index].imageURL ?? "")
                            .padding(.horizontal, 16)
                            .onTapGesture {
                                selectedCard = viewModel.cards[index]
                                store.details.append("details")
                            }
                    }
                }
                .padding(.top, 20)
                .navigationDestination(for: String.self,
                                       destination: {
                    route in
                    switch route {
                    case "details":
                        CardDetailsView(
                            imageURL: selectedCard?.imageURL ?? "",
                            name: selectedCard?.name ?? "",
                            text: selectedCard?.originalText ?? ""
                        )
                    default:
                        EmptyView()
                    }
                })
            }
            .navigationTitle("List of Cards")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                let defaults = UserDefaults.standard
                defaults.removeObject(forKey: Default.Key.cards.rawValue)
                Task {
                    await viewModel.fetchCards()
                }
            }) {
                Image(systemName: "arrow.clockwise")
                    .foregroundColor(Color(named: .black))
                    .imageScale(.large)
            }
            )
            .onAppear {
                Task {
                    await viewModel.fetchCards()
                }
            }
            .alert(isPresented: $viewModel.isrequestError) {
                Alert(
                    title: Text("Error!"),
                    message: Text("An error has occurred please try again."),
                    primaryButton: .default(Text("Retry"), action: {
                        Task {
                            await viewModel.fetchCards()
                        }
                    }), secondaryButton: .cancel()
                )
            }
        }
    }
    
}

#Preview {
    CardListView(viewModel: Constants.cardListViewModel)
        .environmentObject(Store())
}
