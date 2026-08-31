import SwiftUI

struct SplashView: View {
    var body: some View {
        Image("SplashScreen")
            .resizable()
            .ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
