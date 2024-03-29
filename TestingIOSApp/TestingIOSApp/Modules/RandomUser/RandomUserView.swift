import SwiftUI
import Kingfisher
import Combine

struct RandomUserView: View {
    
    @EnvironmentObject var navigationManager: NavigationManager
    @StateObject var viewModel: RandomUserViewModel = RandomUserViewModel()
    @State var imageLoading: Bool = false
    @State var imagePreview: Bool =  false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Spacer()
                    Button {
                        imagePreview = true
                    } label: {
                        KFImage(URL(string: viewModel.picture))
                            .placeholder({ _ in
                                LottieView(animationFinished: $imageLoading, name: "loader3", loopMode: .loop)
                                    .frame(width: 80, height: 80)
                            })
                            .resizable()
                            .frame(width: 130, height: 130)
                            .clipShape(Circle())
                    }
                    Spacer()
                    Text("\(viewModel.fullName) \(viewModel.gender == "male" ? "♂" : "♀")")
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .padding(.bottom, 4)
                    Spacer()
                    Text("Hello world, we're testing this header so keep it up with the new updates of our app.")
                        .padding(.leading, 16)
                    Spacer()
                }
                .padding([.leading, .trailing], 16)

            }
            .refreshable {
                viewModel.getRandomUser()
            }
            Spacer()
            VStack {
                HStack {
                    Button {
                        viewModel.getRandomUser()
                    } label: {
                        Text("New")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.red)
                            )
                            .cornerRadius(25)
                    }
                    .buttonStyle(.plain)
                    Button {
                        viewModel.saveRandomUser()
                    } label: {
                        Text("Save")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.accentColor)
                            )
                            .cornerRadius(25)
                    }
                    .buttonStyle(.plain)
                }
                Button {
                    navigationManager.path.append(NavigationRoute.randomUserSavedView)
                } label: {
                    Text("Saved users")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.orange)
                        )
                        .cornerRadius(25)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(16)
        .addLoader(show: $viewModel.isLoading, frame: CGSize(width: 200, height: 200))
        .navigationTitle("Home")
        .onAppear {
            viewModel.getRandomUser()
        }
        .sheet(isPresented: $imagePreview) {
            HStack {
                KFImage(URL(string: viewModel.picture))
                    .placeholder({ _ in
                        LottieView(animationFinished: $imageLoading, name: "loader3", loopMode: .loop)
                            .frame(width: 80, height: 80)
                    })
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

struct RandomUserView_Previews: PreviewProvider {
    static var previews: some View {
        RandomUserView()
    }
}
