import SwiftUI

struct SettingsView: View {
    @State private var viewModel = SettingsViewModel()
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text("Темная тема")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundStyle(ColorConstants.black)
                
                Spacer()
                
                Toggle("",isOn: $viewModel.isDarkMode)
                    .labelsHidden()
            }
            .padding()
            Button{
                viewModel.showAgreement = true
            } label: {
                HStack {
                    Text("Пользовательское соглашение")
                        .font(.system(size: 17, weight: .regular))
                        .foregroundStyle(ColorConstants.black)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .foregroundStyle(ColorConstants.black)
                }
                .padding()
            }
            .fullScreenCover(isPresented: $viewModel.showAgreement) {
                NavigationStack {
                    UserAgreementView()
                }
            }
            
            Spacer()
            
            
            VStack(spacing: 16){
                Text("Приложение использует API «Яндекс.Расписания»")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(ColorConstants.black)
                    .multilineTextAlignment(.center)
                Text("Версия 1.0 (beta)")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(ColorConstants.black)
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom)
        }
    }
}

#Preview {
    SettingsView()
}
