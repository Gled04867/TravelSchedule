import Foundation

@Observable
@MainActor
final class CarrierListViewModel {
    var carriers: [CarrierModel] = []
    var showCarrierCard = false
    var isLoading = false
    var hasError = false
    var fromCity: String = ""
    var toCity: String = ""
    
    var routeTitle: String {
            return "\(fromCity) → \(toCity)"
    }
    
    func loadCarriers(from: String, to: String) async {
        isLoading = true
        hasError = false
        do {
            let segments = try await NetworkClient.shared.getScheduleBetweenStations(from: from, to: to)
            let allCarriers = segments.segments?.compactMap { segment -> CarrierModel? in
                guard let title = segment.thread?.carrier?.title else { return nil }
                let departure = segment.departure ?? ""
                let arrival = segment.arrival ?? ""
                let duration = segment.duration.map { "\($0 / 3600) ч \(($0 % 3600) / 60) мин" } ?? ""
                return CarrierModel(
                    name: title,
                    transfer: nil,
                    date: departure,
                    departure: String(departure.prefix(5)),
                    duration: duration,
                    arrival: String(arrival.prefix(5))
                )
            } ?? []
            
            var seen = Set<String>()
            carriers = allCarriers.filter { carrier in
                let key = "\(carrier.name)-\(carrier.date)"
                return seen.insert(key).inserted
            }
        } catch {
            hasError = true
        }
        isLoading = false
    }
}
