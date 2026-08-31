import SwiftUI

struct FilterRowView: View {
    let title: String
    @Binding var isSelected: Bool
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                .foregroundStyle(ColorConstants.black)
        }
        .padding()
        .onTapGesture {
            isSelected.toggle()
        }
    }
}
