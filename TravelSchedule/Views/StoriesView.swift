import SwiftUI
import Combine

struct StoriesView: View {
    @Binding var stories: [StoryCard]
    let startIndex: Int
    @Binding var isPresented: Bool
    
    @State private var viewModel: StoriesViewModel
    
    init(stories: Binding<[StoryCard]>, startIndex: Int, isPresented: Binding<Bool>) {
        self._stories = stories
        self.startIndex = startIndex
        self._isPresented = isPresented
        self._viewModel = State(initialValue: StoriesViewModel(startIndex: startIndex))
    }
    
    private var currentStory: StoryCard { stories[viewModel.currentIndex] }
    
    var body: some View {
        ZStack {
            Image(currentStory.fullImage)
                .resizable()
                .scaledToFill()
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 8) {
                    Text(currentStory.title)
                        .font(.system(size: 34, weight: .bold))
                        .foregroundStyle(.white)
                        .lineLimit(2)
                    Text(currentStory.description)
                        .font(.system(size: 17, weight: .regular))
                        .foregroundStyle(.white)
                        .lineLimit(3)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 40)
            }
            
            VStack {
                ProgressBar(numberOfSections: stories.count, progress: viewModel.progress)
                    .frame(height: 6)
                    .padding(.horizontal, 12)
                    .padding(.top, 28)
                
                HStack {
                    Spacer()
                    Button {
                        isPresented = false
                    } label: {
                        ZStack {
                            Circle()
                                .fill(.black)
                                .frame(width: 40, height: 40)
                            Image(systemName: "xmark")
                                .foregroundStyle(.white)
                                .font(.system(size: 16, weight: .bold))
                        }
                    }
                    .padding(.trailing, 12)
                    .padding(.top, 8)
                }
                Spacer()
            }
        }
        .onAppear {
            stories[viewModel.currentIndex].isViewed = true
            viewModel.progress = CGFloat(viewModel.currentIndex) / CGFloat(stories.count)
            viewModel.startTimer()
        }
        .onDisappear {
            viewModel.stopTimer()
        }
        .onReceive(viewModel.timer) { _ in
            viewModel.timerTick(storiesCount: stories.count) {
                isPresented = false
            }
        }
        .onTapGesture {
            viewModel.nextStory(storiesCount: stories.count) {
                isPresented = false
            }
            viewModel.resetTimer()
        }
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.width < -50 {
                        viewModel.nextStory(storiesCount: stories.count) {
                            isPresented = false
                        }
                        viewModel.resetTimer()
                    } else if value.translation.width > 50 {
                        viewModel.prevStory()
                        viewModel.resetTimer()
                    }
                }
        )
    }
}
