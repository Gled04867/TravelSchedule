import SwiftUI

struct CarrierListView: View {
    let carriers = [
        Carrier(name: "РЖД", transfer: "С пересадкой в Костроме", date: "14 января", departure: "22:30", duration: "20 часов", arrival: "08:15"),
        Carrier(name: "ФГК", transfer: nil, date: "15 января", departure: "01:15", duration: "9 часов", arrival: "09:00"),
        Carrier(name: "Урал логистика", transfer: nil, date: "16 января", departure: "12:30", duration: "9 часов", arrival: "21:00"),
        Carrier(name: "РЖД", transfer: "С пересадкой в Костроме", date: "17 января", departure: "22:30", duration: "20 часов", arrival: "08:15")
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text("Москва (Ярославский вокзал) → Санкт Петербург (Балтийский вокзал)")
                    .font(.system(size: 24, weight: .bold))
                    .padding(.horizontal)
                
                List(carriers, id: \.name) { carrier in
                    CarrierRowView(carrier: carrier)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
            }
            
            NavigationLink {
                FiltersView()
            } label: {
                Text("Уточнить время")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(ColorConstants.blueUniversal)
                    .foregroundStyle(ColorConstants.whiteUniversal)
                    .cornerRadius(16)
                    .padding(.horizontal)
            }
        }
    }
}

#Preview {
    CarrierListView()
}
