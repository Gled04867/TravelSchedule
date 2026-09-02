import SwiftUI

struct MainView: View {
    @State private var fromCity: String = ""
    @State private var toCity: String = ""
    @State private var showCityList = false
    @State private var isSelectingFrom = true
    
    var body: some View {
        VStack(spacing: 16) {
            Rectangle()
                .fill(Color.clear)
                .frame(height: 188)
            
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
    }
}

#Preview {
    MainView()
}
