//
//  MainView.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 09/04/23.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    
    private let alamo: CallingAnAPI = CallingAnAPI()
    
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
                alamo.getRandomUser()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
