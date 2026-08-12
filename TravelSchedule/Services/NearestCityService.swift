import OpenAPIRuntime
import OpenAPIURLSession

protocol NearestCityServiceProtocol {
    func getNearestCity(lat: Double, lng: Double) async throws -> Components.Schemas.NearestCityResponse
}

final class NearestCityService: NearestCityServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getNearestCity(lat: Double, lng: Double) async throws -> Components.Schemas.NearestCityResponse {
        let response = try await client.getNearestCity(query: .init(
            apikey: apikey,
            lat: lat,
            lng: lng
        ))
        return try response.ok.body.json
    }
}
