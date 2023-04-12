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
    
    var fullName: String {
        guard let name = self.response?.results.first?.name else { return "" }
        return "\(name.first) \(name.last)"
    }
    
    var picture: String {
        return self.response?.results.first?.picture.large ?? ""
    }
        
    func getRandomUser() {
        AF.request(RandomUserConstants.baseURL,
                   interceptor: CustomInterceptor())
            .responseDecodable(of: RandomUserModel.self) { response in
                if response.error == nil {
                    self.response = response.value
                } else {
                    debugPrint(response)
                }
            }
    }
}
