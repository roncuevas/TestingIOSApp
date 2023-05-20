//
//  CarouselViewModel.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 20/05/23.
//

import Foundation
import SwiftUI

class CarouselViewModel: ObservableObject {
    @Published var imagesArray = [ImageWrapper]()
//    @Published var imagesArray: [ImageWrapper] = .init()
    let network: AsyncNetworkCall = .init()
    
    func refreshImages(count: Int) async {
        // Reset array
        self.imagesArray.removeAll()
        // Getting the images
        for _ in 0...count-1 {
            async let imageResponse: Image = network.getImage(from: "https://picsum.photos/200")
            do {
                try await self.imagesArray.append(ImageWrapper(image: imageResponse))
            } catch let error {
                print("Error \(error)")
            }
        }
    }
}

// MARK: Models of CarouselViewModel
extension CarouselViewModel {
    struct ImageWrapper: Identifiable {
        let id: UUID = .init()
        let image: Image
    }
}
