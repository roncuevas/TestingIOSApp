//
//  TestingViewBuilder.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 26/04/23.
//

import SwiftUI

struct HeaderViewGeneric<Content: View>: View {
    
    let title: String
    let description: String
    let content: Content
    
    init(title: String, description: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.description = description
        self.content = content()
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(description)
                    .font(.callout)
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 2)
            }
            .frame(maxWidth: .infinity)
            .padding()
            content
            Spacer()
        }
    }
}

struct LocalViewBuilder: View {
    
    enum ViewType {
        case text, image, nothing
    }
    
    let type: ViewType
    
    @ViewBuilder private var mainView: some View {
        switch self.type {
        case .image:
            imageView
        case .text:
            textView
        case .nothing:
            nothingView
        }
    }
    
    private var textView: some View {
        Text("Texto")
    }
    
    private var imageView: some View {
        Image(systemName: "heart.fill")
    }
    
    private var nothingView: some View {
        EmptyView()
    }
    
    init(type: ViewType) {
        self.type = type
    }
    
    var body: some View {
        mainView
    }
}

struct TestingViewBuilder: View {
    var body: some View {
        VStack {
            HeaderViewGeneric(title: "Titulo personalizado", description: "Decripcion") {
                Text("Aqui algo de contenido")
            }
            LocalViewBuilder(type: .image)
            LocalViewBuilder(type: .text)
            LocalViewBuilder(type: .nothing)
            Spacer()
        }
    }
}

struct TestingViewBuilder_Previews: PreviewProvider {
    static var previews: some View {
        TestingViewBuilder()
    }
}
