import SwiftUI
import OpenAPIRuntime
import OpenAPIURLSession


struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                MainView()
            }
            .tabItem {
                Image(systemName: "arrow.up.circle.fill")
            }
            SettingsView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                }
        }
    }
    
    private func makeClient() throws -> Client {
        Client(
            serverURL: try Servers.Server1.url(),
            transport: URLSessionTransport()
        )
    }
    
    func testFetchNearestStations() {
        Task {
            do {
                let client = try makeClient()
                let service = NearestStationsService(client: client, apikey: APIConstants.apiKey)
                let stations = try await service.getNearestStations(lat: 59.864177, lng: 30.319163, distance: 50)
                print("NearestStations: \(stations)")
            } catch {
                print("Error NearestStations: \(error)")
            }
        }
    }
    
    func testFetchCopyright() {
        Task {
            do {
                let client = try makeClient()
                let service = CopyrightService(client: client, apikey: APIConstants.apiKey)
                let copyright = try await service.getCopyright()
                print("Copyright: \(copyright)")
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func testFetchScheduleBetweenStations() {
        Task {
            do {
                let client = try makeClient()
                let service = SchedualBetweenStationsService(client: client, apikey: APIConstants.apiKey)
                let segments = try await service.getSchedualBetweenStations(from: "s9600213", to: "s9600799")
                print("SchedualBetweenStations: \(segments)")
            } catch {
                print("Error SchedualBetweenStations: \(error)")
            }
        }
    }
    
    func testFetchStationSchedule() {
        Task {
            do {
                let client = try makeClient()
                let service = StationScheduleService(client: client, apikey: APIConstants.apiKey)
                let schedule = try await service.getStationSchedule(station: "s9600213")
                print("StationSchedule: \(schedule)")
            } catch {
                print("Error StationSchedule: \(error)")
            }
        }
    }
    
    func testFetchRouteStations() {
        Task {
            do {
                let client = try makeClient()
                let service = RouteStationsService(client: client, apikey: APIConstants.apiKey)
                let route = try await service.getRouteStations(uid: "111")
                print("RouteStations: \(route)")
            } catch {
                print("Error RouteStations: \(error)")
            }
        }
    }
    
    func testFetchNearestCity() {
        Task {
            do {
                let client = try makeClient()
                let service = NearestCityService(client: client, apikey: APIConstants.apiKey)
                let city = try await service.getNearestCity(lat: 59.864177, lng: 30.319163)
                print("NearestCity: \(city)")
            } catch {
                print("Error NearestCity: \(error)")
            }
        }
    }
    
    func testFetchCarrierInfo() {
        Task {
            do {
                let client = try makeClient()
                let service = CarrierInfoService(client: client, apikey: APIConstants.apiKey)
                let carrier = try await service.getCarrierInfo(code: "111")
                print("CarrierInfo: \(carrier)")
            } catch {
                print("Error CarrierInfo: \(error)")
            }
        }
    }
    
    func testFetchAllStations() {
        Task {
            do {
                let client = try makeClient()
                let service = AllStationsService(client: client, apikey: APIConstants.apiKey)
                let allStations = try await service.getAllStations()
                print("AllStations: \(allStations)")
            } catch {
                print("Error AllStations: \(error)")
            }
        }
    }
}

#Preview {
    ContentView()
}
