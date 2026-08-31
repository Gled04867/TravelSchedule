import SwiftUI

struct ServerErrorView: View {
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            Image("Server Error")
                .resizable()
                .scaledToFit()
                .frame(width: 223, height: 223)
                .cornerRadius(40)
            
            Text("Ошибка сервера")
                .font(.system(size: 24, weight: .bold))
            Spacer()
        }
    }
}

#Preview {
    ServerErrorView()
}
