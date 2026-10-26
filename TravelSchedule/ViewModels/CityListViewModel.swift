import Foundation

@Observable
@MainActor
final class CityListViewModel {
    var searchText = ""
    var cities: [String] = []
    var isLoading = false
    var hasError = false
    
    var filteredCities: [String] {
        if searchText.isEmpty {
            return cities
        } else {
            return cities.filter { $0.contains(searchText) }
        }
    }
    
    func loadCities() async {
        isLoading = true
        hasError = false
        do {
            let allStations = try await NetworkClient.shared.getAllStations()
            var cityList: [String] = []
            allStations.countries?.forEach { country in
                country.regions?.forEach { region in
                    region.settlements?.forEach { settlement in
                        if let title = settlement.title, !title.isEmpty {
                            cityList.append(title)
                        }
                    }
                }
            }
            cities = Array(Set(cityList)).sorted()
        } catch {
            hasError = true
        }
        isLoading = false
    }
}
