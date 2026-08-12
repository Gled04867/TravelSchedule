import OpenAPIRuntime
import OpenAPIURLSession

protocol CarrierInfoServiceProtocol {
    func getCarrierInfo(code: String) async throws -> Components.Schemas.CarrierResponse
}

final class CarrierInfoService: CarrierInfoServiceProtocol {
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getCarrierInfo(code: String) async throws -> Components.Schemas.CarrierResponse {
        let response = try await client.getCarrierInfo(query: .init(
            apikey: apikey,
            code: code
        ))
        return try response.ok.body.json
    }
}
