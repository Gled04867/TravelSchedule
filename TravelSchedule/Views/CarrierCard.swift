import SwiftUI

struct CarrierCard: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 16) {
            Image("RzdImage")
            
            Text("ОАО «РЖД»")
                .font(.system(size: 24, weight: .bold))
                .foregroundStyle(ColorConstants.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("E-mail")
                        .font(.system(size: 17, weight: .regular))
                        .foregroundStyle(ColorConstants.black)
                    Text("i.lozgkina@yandex.ru")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(ColorConstants.blueUniversal)
                }
                .padding(.vertical, 12)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Телефон")
                        .font(.system(size: 17, weight: .regular))
                        .foregroundStyle(ColorConstants.black)
                    Text("+7 (904) 329-27-71")
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
