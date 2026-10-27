import SwiftUI

struct CityListView: View {
    @Environment(\.dismiss) var dismiss
    @State private var viewModel = CityListViewModel()
    @Binding var selectedCity: String
    @Binding var selectedStationCode: String
    @Binding var isPresented: Bool
    
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
            } else if viewModel.filteredCities.isEmpty {
                Spacer()
                Text("Город не найден")
                    .font(.system(size: 24, weight: .bold))
                Spacer()
            } else {
                List(viewModel.filteredCities, id: \.self) { city in
                    NavigationLink(city) {
                        StationsListView(
                            selectedCity: $selectedCity,
                            selectedStationCode: $selectedStationCode,
                            isPresented: $isPresented,
                            cityName: city
                        )
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
        .task {
            await viewModel.loadCities()
        }
    }
}

#Preview {
    CityListView(
        selectedCity: .constant(""),
        selectedStationCode: .constant(""),
        isPresented: .constant(true)
    )
}
