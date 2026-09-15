import SwiftUI
import Combine

struct StoriesView: View {
    @Binding var stories: [StoryCard]
    let startIndex: Int
    @Binding var isPresented: Bool
    
    @State private var currentIndex: Int
    @State private var progress: CGFloat = 0
    @State private var timer: Timer.TimerPublisher = Timer.publish(every: 0.05, on: .main, in: .common)
    @State private var cancellable: Cancellable?
    
    init(stories: Binding<[StoryCard]>, startIndex: Int, isPresented: Binding<Bool>) {
        self._stories = stories
        self.startIndex = startIndex
        self._isPresented = isPresented
        self._currentIndex = State(initialValue: startIndex)
    }
    
    private var currentStory: StoryCard { stories[currentIndex] }
    
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
                ProgressBar(numberOfSections: stories.count, progress: progress)
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
            stories[currentIndex].isViewed = true  // ← добавили
                    progress = CGFloat(currentIndex) / CGFloat(stories.count)
                    timer = Timer.publish(every: 0.05, on: .main, in: .common)
                    cancellable = timer.connect()
        }
        .onDisappear {
            cancellable?.cancel()
        }
        .onReceive(timer) { _ in
            timerTick()
        }
        .onTapGesture {
            nextStory()
            resetTimer()
        }
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.width < -50 {
                        nextStory()
                        resetTimer()
                    } else if value.translation.width > 50 {
                        prevStory()
                        resetTimer()
                    }
                }
        )
    }
    
    private func timerTick() {
        let progressPerTick = 1.0 / CGFloat(stories.count) / 5.0 * 0.05
        var nextProgress = progress + progressPerTick
        if nextProgress >= CGFloat(currentIndex + 1) / CGFloat(stories.count) {
            nextStory()
            return
        }
        if nextProgress >= 1 {
            nextProgress = 0
            isPresented = false
        }
        progress = nextProgress
    }
    
    private func nextStory() {
        let nextIndex = currentIndex + 1
        if nextIndex < stories.count {
            currentIndex = nextIndex
            stories[nextIndex].isViewed = true
            progress = CGFloat(nextIndex) / CGFloat(stories.count)
        } else {
            isPresented = false
        }
    }
    
    private func resetTimer() {
        cancellable?.cancel()
        timer = Timer.publish(every: 0.05, on: .main, in: .common)
        cancellable = timer.connect()
    }
    
    private func prevStory() {
        let prevIndex = currentIndex - 1
        if prevIndex >= 0 {
            currentIndex = prevIndex
            progress = CGFloat(prevIndex) / CGFloat(stories.count)
        }
    }
}
