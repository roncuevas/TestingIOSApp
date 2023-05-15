//
//  RandomUserViewModel+Network.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 07/05/23.
//

import Foundation
import Alamofire

extension RandomUserViewModel {
    func getRandomUser() {
        self.isLoading = true
        
        AF.request(RandomUserConstants.baseURL,
                   interceptor: CustomInterceptor())
            .responseDecodable(of: RandomUserModel.self) { response in
                if response.error == nil {
                    self.response = response.value
                    self.isLoading = false
                } else {
                    debugPrint(response)
                }
            }
    }
    
    func getRandomUser() async throws -> RandomUserModel {
        return try await AF.request(RandomUserConstants.baseURL, interceptor: CustomInterceptor()).serializingDecodable(RandomUserModel.self).value
    }
}
