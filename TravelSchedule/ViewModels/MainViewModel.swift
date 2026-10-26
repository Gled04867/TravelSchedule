import Foundation

@Observable
@MainActor
final class MainViewModel {
    var fromCity: String = ""
    var toCity: String = ""
    var fromStationCode: String = ""
    var toStationCode: String = ""
    var showCityList = false
    var isSelectingFrom = true
    var stories = StoryCard.stories
    var showStories = false
    var selectedStoryIndex = 0
    var fromCityName: String = ""
    var toCityName: String = ""
    
    func swapCities() {
        swap(&fromCity, &toCity)
        swap(&fromStationCode, &toStationCode)
    }
}
