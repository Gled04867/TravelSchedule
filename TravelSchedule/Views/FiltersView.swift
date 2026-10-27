import SwiftUI

struct FiltersView: View {
    @State private var viewModel = FiltersViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Время отправления")
                .font(.system(size: 24, weight: .bold))
                .padding()
            
            FilterRowView(title: "Утро 06:00 - 12:00", isSelected: $viewModel.morningSelected)
            FilterRowView(title: "День 12:00 - 18:00", isSelected: $viewModel.afternoonSelected)
            FilterRowView(title: "Вечер 18:00 - 00:00", isSelected: $viewModel.eveningSelected)
            FilterRowView(title: "Ночь 00:00 - 06:00", isSelected: $viewModel.nightSelected)
            
            Text("Показывать варианты с пересадками")
                .font(.system(size: 24, weight: .bold))
                .padding()
            
            HStack {
                Text("Да")
                Spacer()
                Image(systemName: viewModel.showTransfers ? "circle.inset.filled" : "circle")
                    .foregroundStyle(ColorConstants.blackUniversal)
            }
            .padding()
            .onTapGesture { viewModel.showTransfers = true }
            
            HStack {
                Text("Нет")
                Spacer()
                Image(systemName: viewModel.showTransfers ? "circle" : "circle.inset.filled")
                    .foregroundStyle(ColorConstants.blackUniversal)
            }
            .padding()
            .onTapGesture { viewModel.showTransfers = false }
            
            Spacer()
            
            if viewModel.hasSelection {
                Button("Применить") { }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(ColorConstants.blueUniversal)
                    .foregroundStyle(ColorConstants.whiteUniversal)
                    .cornerRadius(16)
                    .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FiltersView()
}
