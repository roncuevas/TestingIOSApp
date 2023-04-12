//
//  RandomUserViewModel.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 11/04/23.
//

import Foundation
import Alamofire

class RandomUserViewModel: ObservableObject {
    
    @Published var response: RandomUserModel?
    @Published var isLoading: Bool = true
    
    var fullName: String {
        guard let name = self.response?.results.first?.name else { return "" }
        return "\(name.first) \(name.last)"
    }
    
    var picture: String {
        return self.response?.results.first?.picture.large ?? ""
    }
        
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
}
