//
//  CarouselView.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 19/05/23.
//

import SwiftUI

struct CarouselView: View {
    
    @StateObject var viewModel: CarouselViewModel = .init()
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: .init(repeating: .init(), count: 3)) {
                ForEach(viewModel.imagesArray, id: \.id) { imageWrapped in
                    imageWrapped.image
                        .resizable()
                        .frame(width: 100, height: 100)
                }
            }
        }
        .task {
            await viewModel.refreshImages(count: 21)
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}
