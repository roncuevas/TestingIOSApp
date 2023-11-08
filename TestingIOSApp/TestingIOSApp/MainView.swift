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
            FastCustomButtonView(route: .carouselView, text: "Carousel View")
            FastCustomButtonView(route: .scrappingView, text: "Scrapping View")
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
            navigationManager.push(route)
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
