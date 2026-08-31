import SwiftUI

struct CarrierRowView: View {
    let carrier: Carrier
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(ColorConstants.redUniversal)
                    .frame(width: 40, height: 40)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(carrier.name)
                        .font(.system(size: 17, weight: .regular))
                        .foregroundStyle(ColorConstants.black)
                    
                    if let transfer = carrier.transfer {
                        Text(transfer)
                            .font(.system(size: 12))
                            .foregroundStyle(ColorConstants.redUniversal)
                    }
                }
                
                Spacer()
                
                Text(carrier.date)
                    .font(.system(size: 12))
                    .foregroundStyle(ColorConstants.black)
            }
            
            HStack {
                Text(carrier.departure)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundStyle(ColorConstants.black)
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(ColorConstants.grayUniversal)
                
                Text(carrier.duration)
                    .font(.system(size: 12))
                    .foregroundStyle(ColorConstants.black)
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(ColorConstants.grayUniversal)
                
                Text(carrier.arrival)
                    .font(.system(size: 17, weight: .regular))
                    .foregroundStyle(ColorConstants.black)
            }        }
        .padding()
        .background(ColorConstants.lightGray)
        .cornerRadius(16)
    }
}

