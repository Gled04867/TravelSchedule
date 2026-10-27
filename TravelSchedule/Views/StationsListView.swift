import SwiftUI

struct StationsListView: View {
    @Environment(\.dismiss) var dismiss
    @State private var viewModel = StationsListViewModel()
    @Binding var selectedCity: String
    @Binding var selectedStationCode: String
    @Binding var isPresented: Bool
    let cityName: String
    
    var body: some View {
        VStack {
            TextField("Введите запрос", text: $viewModel.searchText)
                .padding(8)
                .background(ColorConstants.lightGray)
                .cornerRadius(10)
                .padding(.horizontal)
            
            if viewModel.isLoading {
                Spacer()
                ProgressView()
                Spacer()
            } else if viewModel.hasError {
                Spacer()
                ServerErrorView()
                Spacer()
            } else if viewModel.filteredStations.isEmpty {
                Spacer()
                Text("Станция не найдена")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
            } else {
                List(viewModel.filteredStations, id: \.self) { station in
                    Button(station) {
                        selectedCity = station
                        selectedStationCode = viewModel.stationCodes[station] ?? ""
                        isPresented = false
                    }
                    .foregroundStyle(ColorConstants.blackUniversal)
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Выбор станции")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.loadStations(for: cityName)
        }
    }
}

#Preview {
    StationsListView(
        selectedCity: .constant(""),
        selectedStationCode: .constant(""),
        isPresented: .constant(true),
        cityName: "Москва"
    )
}
