import Foundation
import SwiftUI

@MainActor
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
    
    func refreshImagesWithTaskGroup(count: Int) async {
        self.imagesArray.removeAll()
        
        try? await withThrowingTaskGroup(of: Image.self) { group in
            // Adding tasks to the group
            for _ in 0...count-1 {
                group.addTask(priority: .medium) {
                    try await self.network.getImage(from: "https://picsum.photos/200")
                }
            }
            
            for try await taskResult in group {
                self.imagesArray.append(ImageWrapper(image: taskResult))
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
