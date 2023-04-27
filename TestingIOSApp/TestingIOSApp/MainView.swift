//
//  MainView.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 09/04/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        List {
            FastCustomButtonView(route: .randomUserView, text: "Random User View")
            FastCustomButtonView(route: .testingModifiers, text: "Testing Modifiers View")
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
