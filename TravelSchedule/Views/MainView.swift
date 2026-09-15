import SwiftUI

struct MainView: View {
    @State private var fromCity: String = ""
    @State private var toCity: String = ""
    @State private var showCityList = false
    @State private var isSelectingFrom = true
    @State private var stories = StoryCard.stories
    @State private var showStories = false
    @State private var selectedStoryIndex = 0
    
    var body: some View {
        VStack(spacing: 16) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(stories.indices, id: \.self) { index in
                        StoryCardView(story: stories[index])
                            .onTapGesture {
                                selectedStoryIndex = index
                                showStories = true
                                stories[index].isViewed = true
                            }
                    }
                }
                .padding(.horizontal, 16)
            }
            
            HStack(spacing: 10) {
                VStack(spacing: 0) {
                    Button(fromCity.isEmpty ? "Откуда" : fromCity) {
                        isSelectingFrom = true
                        showCityList = true
                    }
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .foregroundStyle(fromCity.isEmpty ? ColorConstants.grayUniversal : ColorConstants.blackUniversal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                    Divider()
                    
                    Button(toCity.isEmpty ? "Куда" : toCity) {
                        isSelectingFrom = false
                        showCityList = true
                    }
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .foregroundStyle(toCity.isEmpty ? ColorConstants.grayUniversal : ColorConstants.blackUniversal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
                .background(ColorConstants.whiteUniversal)
                .cornerRadius(20)
                
                Button {
                    swap(&fromCity, &toCity)
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
            
            if !fromCity.isEmpty && !toCity.isEmpty {
                NavigationLink {
                    CarrierListView()
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
        .fullScreenCover(isPresented: $showCityList) {
            NavigationStack {
                CityListView(
                    selectedCity: isSelectingFrom ? $fromCity : $toCity,
                    isPresented: $showCityList
                )
            }
        }
        .fullScreenCover(isPresented: $showStories) {
            StoriesView(
                stories: $stories,
                startIndex: selectedStoryIndex,
                isPresented: $showStories
            )
        }
    }
}

#Preview {
    MainView()
}
