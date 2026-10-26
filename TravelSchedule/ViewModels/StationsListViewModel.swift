import Foundation

@Observable
@MainActor
final class StationsListViewModel {
    var searchText = ""
    var stations: [String] = []
    var stationCodes: [String: String] = [:]  // название → код станции
    var isLoading = false
    var hasError = false
    
    var filteredStations: [String] {
        if searchText.isEmpty {
            return stations
        } else {
            return stations.filter { $0.contains(searchText) }
        }
    }
    
    func loadStations(for cityName: String) async {
        isLoading = true
        hasError = false
        do {
            let allStations = try await NetworkClient.shared.getAllStations()
            var stationList: [String] = []
            var codes: [String: String] = [:]
            
            allStations.countries?.forEach { country in
                country.regions?.forEach { region in
                    region.settlements?.forEach { settlement in
                        guard settlement.title == cityName else { return }
                        settlement.stations?.forEach { station in
                            if let title = station.title, !title.isEmpty {
                                stationList.append(title)
                                if let code = station.codes?.yandex_code {
                                    codes[title] = code
                                }
                            }
                        }
                    }
                }
            }
            stations = stationList.sorted()
            stationCodes = codes
        } catch {
            hasError = true
        }
        isLoading = false
    }
}
