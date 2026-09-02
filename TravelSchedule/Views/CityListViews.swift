import SwiftUI

struct CityListView: View {
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    @Binding var selectedCity: String
    @Binding var isPresented: Bool
    
    let cities = ["Москва", "Санкт Петербург", "Сочи", "Горный воздух", "Краснодар", "Казань", "Омск"]
    
    var filteredCities: [String] {
        if searchText.isEmpty {
            return cities
        } else {
            return cities.filter { $0.contains(searchText) }
        }
    }
    
    var body: some View {
        VStack {
            TextField("Введите запрос", text: $searchText)
                .padding(8)
                .background(ColorConstants.lightGray)
                .cornerRadius(10)
                .padding(.horizontal)
            
            if filteredCities.isEmpty {
                Spacer()
                Text("Город не найден")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
            } else {
                List(filteredCities, id: \.self) { city in
                    NavigationLink(city) {
                        StationsListView(selectedCity: $selectedCity, isPresented: $isPresented, cityName: city)
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Выбор города")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading:
                                Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .foregroundStyle(ColorConstants.black)
        }
                            )
    }
}

#Preview {
    CityListView(selectedCity: .constant(""), isPresented: .constant(true))
}
