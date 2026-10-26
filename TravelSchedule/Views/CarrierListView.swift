import SwiftUI

struct CarrierListView: View {
    let fromCode: String
    let toCode: String
    let fromCity: String
    let toCity: String
    @State private var viewModel = CarrierListViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text(viewModel.routeTitle)
                    .font(.system(size: 24, weight: .bold))
                    .padding(.horizontal)
                
                if viewModel.isLoading {
                    Spacer()
                    ProgressView()
                    Spacer()
                } else if viewModel.hasError {
                    Spacer()
                    ServerErrorView()
                    Spacer()
                } else {
                    List(viewModel.carriers, id: \.departure) { carrier in
                        CarrierRowView(carrier: carrier)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                            .onTapGesture {
                                viewModel.showCarrierCard = true
                            }
                    }
                    .listStyle(.plain)
                }
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
        .navigationDestination(isPresented: $viewModel.showCarrierCard) {
            CarrierCard()
        }
        .onAppear {
            viewModel.fromCity = fromCity
            viewModel.toCity = toCity
        }
        .task {
            await viewModel.loadCarriers(from: fromCode, to: toCode)
        }
    }
}

#Preview {
    CarrierListView(fromCode: "s9600213", toCode: "s9600217", fromCity: "Москва (Ленинградский вокзал)", toCity: "Санкт-Петербург (Московский вокзал)")
}
