//
//  RandomUsersSavedViewModel.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 16/04/23.
//

import Foundation

class RandomUsersSavedViewModel: ObservableObject {
    
    @Published var savedUsers: [RandomUserRealmModel] = []
    @Published var isLoading: Bool = false
    
    func getAllRandomUsers() {
        isLoading = true
        let dbManager = RandomUserDatabase()
        let users = dbManager.readRandomUsers()
        isLoading = false
        guard let users else { return }
        self.savedUsers = Array(users)
    }
}
