//
//  RandomUserViewModel.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 11/04/23.
//

import Foundation

class RandomUserViewModel: ObservableObject {
    
    @Published var response: RandomUserModel?
    @Published var isLoading: Bool = true
    
    var first: RandomUserResult? {
        return self.response?.results.first
    }
    
    var fullName: String {
        guard let name = self.response?.results.first?.name else { return "" }
        return "\(name.first) \(name.last)"
    }
    
    var picture: String {
        return self.response?.results.first?.picture.large ?? ""
    }
    
    var gender: String {
        return self.response?.results.first?.gender ?? ""
    }
    
    func saveRandomUser() {
        guard let response = response?.results.first else { return }
        let dbManager = RandomUserDatabase()
        let user = RandomUserRealmModel(gender: response.gender, name: self.fullName,
                                        email: response.email, phone: response.phone,
                                        large: response.picture.large, response: self.response?.toData())
        dbManager.writeRandomUser(user: user)
    }
}
