import SwiftUI

struct FiltersView: View {
    @State private var morningSelected = false
    @State private var afternoonSelected = false
    @State private var eveningSelected = false
    @State private var nightSelected = false
    
    @State private var showTransfers = true
    
    var hasSelection: Bool {
        morningSelected || afternoonSelected || eveningSelected || nightSelected
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Время отправления")
                .font(.system(size: 24, weight: .bold))
                .padding()
            
            FilterRowView(title: "Утро 06:00 - 12:00", isSelected: $morningSelected)
            FilterRowView(title: "День 12:00 - 18:00", isSelected: $afternoonSelected)
            FilterRowView(title: "Вечер 18:00 - 00:00", isSelected: $eveningSelected)
            FilterRowView(title: "Ночь 00:00 - 06:00", isSelected: $nightSelected)
            
            Text("Показывать варианты с пересадками")
                .font(.system(size: 24, weight: .bold))
                .padding()
            
            HStack {
                Text("Да")
                Spacer()
                Image(systemName: showTransfers ? "circle.inset.filled" : "circle")
                    .foregroundStyle(ColorConstants.black)
            }
            .padding()
            .onTapGesture { showTransfers = true }
            
            HStack {
                Text("Нет")
                Spacer()
                Image(systemName: showTransfers ? "circle" : "circle.inset.filled")
                    .foregroundStyle(ColorConstants.black)
            }
            .padding()
            .onTapGesture { showTransfers = false }
            
            Spacer()
            
            if hasSelection {
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
