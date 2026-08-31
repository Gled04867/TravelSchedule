import SwiftUI

@main
struct TravelScheduleApp: App {
    @State private var isLaunching = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if isLaunching {
                    Image("SplashScreen")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    isLaunching = false
                                }
                            }
                        }
                } else {
                    ContentView()
                }
            }
        }
    }
}
