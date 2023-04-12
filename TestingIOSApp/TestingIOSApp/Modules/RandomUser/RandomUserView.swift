//
//  RandomUserView.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 11/04/23.
//

import SwiftUI
import Kingfisher

struct RandomUserView: View {
    
    @StateObject var viewModel: RandomUserViewModel = RandomUserViewModel()
    
    var body: some View {
        VStack {
            HStack {
                KFImage(URL(string: viewModel.picture))
                    .placeholder({ _ in
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 70, height: 70)
                    })
                    .resizable()
                    .frame(width: 100, height: 100)
                Spacer()
                VStack {
                    Text(viewModel.fullName)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("")
                }
                Spacer()
            }
            Spacer()
        }
        .padding(10)
        .onAppear {
            viewModel.getRandomUser()
        }
    }
}

struct RandomUserView_Previews: PreviewProvider {
    static var previews: some View {
        RandomUserView()
    }
}
