import SwiftUI

struct StoryCard: Identifiable, Sendable {
    let id = UUID()
    let previewImage: String
    let fullImage: String
    let title: String
    let description: String
    var isViewed: Bool = false
    
    static let stories: [StoryCard] = [
        StoryCard(previewImage: "preview1", fullImage: "stories1", title: "Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"),
        StoryCard(previewImage: "preview2", fullImage: "stories2", title: "Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"),
        StoryCard(previewImage: "preview3", fullImage: "stories3", title: "Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"),
        StoryCard(previewImage: "preview4", fullImage: "stories4", title: "Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"),
        StoryCard(previewImage: "preview5", fullImage: "stories5", title: "Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"),
        StoryCard(previewImage: "preview6", fullImage: "stories6", title: "Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"),
        StoryCard(previewImage: "preview7", fullImage: "stories7", title: "Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"),
        StoryCard(previewImage: "preview8", fullImage: "stories8", title: "Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text"),
        StoryCard(previewImage: "preview9", fullImage: "stories9", title: "Text Text Text Text Text Text Text Text Text Text", description: "Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text Text")
    ]
}
