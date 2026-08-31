import SwiftUI

struct StationsListView: View {
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    @Binding var selectedCity: String
    @Binding var isPresented: Bool
    let cityName: String
    
    let stations = ["Киевский вокзал", "Курский вокзал", "Ярославский вокзал", "Белорусский вокзал", "Савеловский вокзал", "Ленинградский вокзал"]
    
    var filteredStations: [String] {
        if searchText.isEmpty {
            return stations
        } else {
            return stations.filter { $0.contains(searchText) }
        }
    }
    
    var body: some View {
        VStack {
            TextField("Введите запрос", text: $searchText)
                .padding(8)
                .background(ColorConstants.lightGray)
                .cornerRadius(10)
                .padding(.horizontal)
            
            if filteredStations.isEmpty {
                Spacer()
                Text("Станция не найдена")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
            } else {
                List(filteredStations, id: \.self) { station in
                    Button(station) {
                        selectedCity = "\(cityName) (\(station))"
                        isPresented = false
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Выбор станции")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    StationsListView(selectedCity: .constant(""), isPresented: .constant(true), cityName: "Москва")
}
