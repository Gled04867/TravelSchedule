import SwiftUI

struct MainView: View {
    @State private var viewModel = MainViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(viewModel.stories.indices, id: \.self) { index in
                        StoryCardView(story: viewModel.stories[index])
                            .onTapGesture {
                                viewModel.selectedStoryIndex = index
                                viewModel.showStories = true
                                viewModel.stories[index].isViewed = true
                            }
                    }
                }
                .padding(.horizontal, 16)
            }
            
            HStack(spacing: 10) {
                VStack(spacing: 0) {
                    Button(viewModel.fromCity.isEmpty ? "Откуда" : viewModel.fromCity) {
                        viewModel.isSelectingFrom = true
                        viewModel.showCityList = true
                    }
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .foregroundStyle(viewModel.fromCity.isEmpty ? ColorConstants.grayUniversal : ColorConstants.blackUniversal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                    Divider()
                    
                    Button(viewModel.toCity.isEmpty ? "Куда" : viewModel.toCity) {
                        viewModel.isSelectingFrom = false
                        viewModel.showCityList = true
                    }
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .foregroundStyle(viewModel.toCity.isEmpty ? ColorConstants.grayUniversal : ColorConstants.blackUniversal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
                .background(ColorConstants.whiteUniversal)
                .cornerRadius(20)
                
                Button {
                    viewModel.swapCities()
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .foregroundStyle(ColorConstants.blueUniversal)
                        .padding()
                        .background(ColorConstants.whiteUniversal)
                        .clipShape(Circle())
                }
            }
            .padding(16)
            .background(ColorConstants.blueUniversal)
            .cornerRadius(20)
            .padding(.horizontal, 16)
            
            if !viewModel.fromCity.isEmpty && !viewModel.toCity.isEmpty {
                NavigationLink {
                    CarrierListView(
                        fromCode: viewModel.fromStationCode,
                        toCode: viewModel.toStationCode,
                        fromCity: viewModel.fromCity,
                        toCity: viewModel.toCity
                    )
                    .toolbar(.hidden, for: .tabBar)
                } label: {
                    Text("Найти")
                        .padding(.vertical, 12)
                        .padding(.horizontal, 48)
                        .background(ColorConstants.blueUniversal)
                        .foregroundStyle(ColorConstants.whiteUniversal)
                        .cornerRadius(16)
                }
            }
            
            Spacer()
        }
        .fullScreenCover(isPresented: $viewModel.showCityList) {
            NavigationStack {
                CityListView(
                    selectedCity: viewModel.isSelectingFrom ? $viewModel.fromCity : $viewModel.toCity,
                    selectedStationCode: viewModel.isSelectingFrom ? $viewModel.fromStationCode : $viewModel.toStationCode,
                    isPresented: $viewModel.showCityList
                )
            }
        }
        .fullScreenCover(isPresented: $viewModel.showStories) {
            StoriesView(
                stories: $viewModel.stories,
                startIndex: viewModel.selectedStoryIndex,
                isPresented: $viewModel.showStories
            )
        }
    }
}

#Preview {
    MainView()
}
