import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias AllStations = Components.Schemas.AllStationsResponse

protocol AllStationsServiceProtocol {
    func getAllStations() async throws -> AllStations
}

final class AllStationsService: AllStationsServiceProtocol {
    private enum Constants {
            static let responseBodySizeLimit = 50 * 1024 * 1024
        }
    
    private let client: Client
    private let apikey: String
    
    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }
    
    func getAllStations() async throws -> AllStations {
        let response = try await client.getAllStations(query: .init(apikey: apikey))
        let responseBody = try response.ok.body.text_html_charset_utf_hyphen_8
        let fullData = try await Data(collecting: responseBody, upTo: Constants.responseBodySizeLimit)
        let allStations = try JSONDecoder().decode(AllStations.self, from: fullData)
        return allStations
    }
}
