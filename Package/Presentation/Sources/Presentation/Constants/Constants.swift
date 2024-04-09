//
//  Constants.swift
//
//
//  Created by Leonardo Mendez on 9/04/24.
//

import Foundation
import Domain
import Data
import Alamofire

public class Constants {
    
    public static var cardListViewModel =  generateCardListViewModule()

    private static func generateCardListViewModule() -> CardsListViewModel {
        let repository = FetchCardListRepository(dataSource: FetchCardsListDataSource(apiClient: createClient()))
        let useCase = FetchCardsListUseCase(repository: repository)
        let cardsListViewModel = CardsListViewModel(useCase: useCase, store: Store.storeDefault)
        return cardsListViewModel
    }
    
    fileprivate static func createClient() -> APIClient {
        let host = "https://api.magicthegathering.io/v1/"
        let server = DefaultAPIServer(host: host)
        return APIClient(server: server, session: Session())
    }
    
}
