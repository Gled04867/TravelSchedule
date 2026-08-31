import SwiftUI

struct NoInternetView: View {
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            Image("No Internet")
                .resizable()
                .scaledToFit()
                .frame(width: 223, height: 223)
                .cornerRadius(40)
            
            Text("Нет интернета")
                .font(.system(size: 24, weight: .bold))
            Spacer()
        }
    }
}

#Preview {
    NoInternetView()
}
