//
//  RandomUserView.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 11/04/23.
//

import SwiftUI
import Kingfisher

struct RandomUserView: View {
    @State var headerText: String = "Hola mundo, como estas este es el header"
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                VStack {
                    Text("John Doe")
                        .multilineTextAlignment(.center)
                    TextEditor(text: $headerText)
                }
            }
        }
        .padding(10)
    }
}

struct RandomUserView_Previews: PreviewProvider {
    static var previews: some View {
        RandomUserView()
    }
}
