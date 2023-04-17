//
//  RandomUsersSavedView.swift
//  TestingIOSApp
//
//  Created by Aarón Alberto Martínez Cuevas on 16/04/23.
//

import SwiftUI
import Kingfisher

struct RandomUsersSavedView: View {
    
    @StateObject var viewModel: RandomUsersSavedViewModel = RandomUsersSavedViewModel()
    
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.savedUsers, id: \.self) { user in
                    HStack {
                        KFImage(URL(string: user.large))
                            .resizable()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                        Spacer()
                        Text(user.name)
                            .font(.system(size: 18))
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                }
                .onDelete { index in
                    print("Deleting \(index)")
                }
                .listStyle(PlainListStyle())
            }
            .refreshable {
                viewModel.getAllRandomUsers()
            }
        }
        .onAppear {
            viewModel.getAllRandomUsers()
        }
        .addLoader(show: $viewModel.isLoading, frame: CGSize(width: 100, height: 100))
    }
}

struct RandomUsersSavedView_Previews: PreviewProvider {
    static var previews: some View {
        RandomUsersSavedView()
    }
}
