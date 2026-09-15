import SwiftUI

struct StoryCardView: View {
    let story: StoryCard
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(story.previewImage)
                .resizable()
                .scaledToFill()
                .frame(width: 92, height: 140)
                .cornerRadius(16)
                .opacity(story.isViewed ? 0.5 : 1.0)
            
            Text(story.title)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.white)
                .lineLimit(3)
                .padding(8)
        }
        .frame(width: 92, height: 140)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(ColorConstants.blueUniversal, lineWidth: story.isViewed ? 0 : 2)
        )
    }
}

#Preview {
    StoryCardView(story: StoryCard.stories[0])
}
