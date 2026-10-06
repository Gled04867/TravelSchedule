import SwiftUI

@Observable class SettingsViewModel {
    @ObservationIgnored
    @AppStorage("isDarkMode") var isDarkMode = false
    var showAgreement = false
}

