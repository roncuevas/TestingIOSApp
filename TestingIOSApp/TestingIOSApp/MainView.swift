//
//  MainView.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 09/04/23.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    
    private let viewModel: RandomUserViewModel = RandomUserViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    navigationManager.path.append(NavigationRoute.splashScreenView)
                } label: {
                    Text("SplashScreen")
                }

            }
            .onAppear {
                viewModel.getRandomUser()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
