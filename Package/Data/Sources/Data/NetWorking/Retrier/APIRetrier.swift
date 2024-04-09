//
//  APIRetrier.swift
//
//
//  Created by Leonardo Mendez on 9/04/24.
//

import Foundation
import Alamofire
import Domain
import Shared

@available(iOS 13, *)
public struct APIRetrier: RequestRetrier {
    
    private let lock = NSLock()
    private let apiClient: APIClient
    
    public init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    public func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {

    }
    
}
