import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

actor NetworkClient {
    static let shared = NetworkClient()
    
    private let nearestStationsService: NearestStationsService
    private let copyrightService: CopyrightService
    private let scheduleBetweenStationsService: SchedualBetweenStationsService
    private let stationScheduleService: StationScheduleService
    private let routeStationsService: RouteStationsService
    private let nearestCityService: NearestCityService
    private let carrierInfoService: CarrierInfoService
    private let allStationsService: AllStationsService
    
    private init() {
        let client = Client(
            serverURL: try! Servers.Server1.url(),
            transport: URLSessionTransport()
        )
        let apikey = APIConstants.apiKey
        
        nearestStationsService = NearestStationsService(client: client, apikey: apikey)
        copyrightService = CopyrightService(client: client, apikey: apikey)
        scheduleBetweenStationsService = SchedualBetweenStationsService(client: client, apikey: apikey)
        stationScheduleService = StationScheduleService(client: client, apikey: apikey)
        routeStationsService = RouteStationsService(client: client, apikey: apikey)
        nearestCityService = NearestCityService(client: client, apikey: apikey)
        carrierInfoService = CarrierInfoService(client: client, apikey: apikey)
        allStationsService = AllStationsService(client: client, apikey: apikey)
    }
    
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        try await nearestStationsService.getNearestStations(lat: lat, lng: lng, distance: distance)
    }
    
    func getCopyright() async throws -> Copyright {
        try await copyrightService.getCopyright()
    }
    
    func getScheduleBetweenStations(from: String, to: String) async throws -> Components.Schemas.Segments {
        try await scheduleBetweenStationsService.getSchedualBetweenStations(from: from, to: to)
    }
    
    func getStationSchedule(station: String) async throws -> Components.Schemas.ScheduleResponse {
        try await stationScheduleService.getStationSchedule(station: station)
    }
    
    func getRouteStations(uid: String) async throws -> Components.Schemas.ThreadStationsResponse {
        try await routeStationsService.getRouteStations(uid: uid)
    }
    
    func getNearestCity(lat: Double, lng: Double) async throws -> Components.Schemas.NearestCityResponse {
        try await nearestCityService.getNearestCity(lat: lat, lng: lng)
    }
    
    func getCarrierInfo(code: String) async throws -> Components.Schemas.CarrierResponse {
        try await carrierInfoService.getCarrierInfo(code: code)
    }
    
    func getAllStations() async throws -> AllStations {
            try await allStationsService.getAllStations()
        }
}
