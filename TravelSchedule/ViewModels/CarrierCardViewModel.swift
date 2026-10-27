import Foundation

@Observable
@MainActor
final class CarrierCardViewModel {
    var carrierName: String = "ОАО «РЖД»"
    var email: String = "i.lozgkina@yandex.ru"
    var phone: String = "+7 (904) 329-27-71"
    var imageName: String = "RzdImage"
}
