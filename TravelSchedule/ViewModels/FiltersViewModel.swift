import Foundation

@Observable
@MainActor
final class FiltersViewModel {
    var morningSelected = false
    var afternoonSelected = false
    var eveningSelected = false
    var nightSelected = false
    var showTransfers = true
    
    var hasSelection: Bool {
        morningSelected || afternoonSelected || eveningSelected || nightSelected
    }
}
