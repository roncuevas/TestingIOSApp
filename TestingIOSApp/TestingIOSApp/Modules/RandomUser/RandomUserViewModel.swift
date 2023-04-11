//
//  RandomUserViewModel.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 11/04/23.
//

import Foundation
import Alamofire

class RandomUserViewModel: ObservableObject {
    @Published var response: RandomUserModel
    
    init(response: RandomUserModel) {
        self.response = response
    }
    
    func getRandomUser() {
        AF.request("https://api.randomuser.me")
            .responseDecodable (of: RandomUserModel.self) { response in
                guard let rresponse = response.value else { return }
                self.response = rresponse
            }
    }
    
    
}
