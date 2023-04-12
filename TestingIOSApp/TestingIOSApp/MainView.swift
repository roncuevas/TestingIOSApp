//
//  MainView.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 09/04/23.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
        
    var body: some View {
        NavigationView {
            VStack {
                FastCustomButtonView(route: .randomUserView, text: "RandomUserView")
            }
        }
    }
}

struct FastCustomButtonView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    
    private var route: NavigationRoute
    private var text: String
    
    init (route: NavigationRoute, text: String) {
        self.route = route
        self.text = text
    }
    
    var body: some View {
        Button {
            navigationManager.path.append(route)
        } label: {
            Text(text)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
