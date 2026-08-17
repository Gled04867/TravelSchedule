import OpenAPIRuntime
import OpenAPIURLSession

protocol StationScheduleServiceProtocol {
    func getStationSchedule(station: String) async throws -> Components.Schemas.ScheduleResponse
}

final class StationScheduleService: StationScheduleServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getStationSchedule(station: String) async throws -> Components.Schemas.ScheduleResponse {
        let response = try await client.getStationSchedule(query: .init(
            apikey: apikey,
            station: station
        ))
        return try response.ok.body.json
    }
}
