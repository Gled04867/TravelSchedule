import SwiftUI

struct CarrierCard: View {
    @State private var viewModel = CarrierCardViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            Image(viewModel.imageName)
            
            Text(viewModel.carrierName)
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(ColorConstants.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("E-mail")
                        .font(.system(size: 17, weight: .regular))
                        .foregroundStyle(ColorConstants.black)
                    Text(viewModel.email)
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(ColorConstants.blueUniversal)
                }
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Телефон")
                        .font(.system(size: 17, weight: .regular))
                        .foregroundStyle(ColorConstants.black)
                    Text(viewModel.phone)
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(ColorConstants.blueUniversal)
                }
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .background(ColorConstants.white)
        .navigationTitle("Информация о перевозчике")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CarrierCard()
    }
}
