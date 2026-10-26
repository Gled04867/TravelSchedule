import Foundation
import Combine

@Observable
@MainActor
final class StoriesViewModel {
    var currentIndex: Int
    var progress: CGFloat = 0
    var timer: Timer.TimerPublisher = Timer.publish(every: 0.05, on: .main, in: .common)
    var cancellable: Cancellable?
    
    let startIndex: Int
    
    init(startIndex: Int) {
        self.startIndex = startIndex
        self.currentIndex = startIndex
    }
    
    func timerTick(storiesCount: Int, onFinish: () -> Void) {
        let progressPerTick = 1.0 / CGFloat(storiesCount) / 5.0 * 0.05
        var nextProgress = progress + progressPerTick
        if nextProgress >= CGFloat(currentIndex + 1) / CGFloat(storiesCount) {
            nextStory(storiesCount: storiesCount, onFinish: onFinish)
            return
        }
        if nextProgress >= 1 {
            nextProgress = 0
            onFinish()
        }
        progress = nextProgress
    }
    
    func nextStory(storiesCount: Int, onFinish: () -> Void) {
        let nextIndex = currentIndex + 1
        if nextIndex < storiesCount {
            currentIndex = nextIndex
            progress = CGFloat(nextIndex) / CGFloat(storiesCount)
        } else {
            onFinish()
        }
    }
    
    func prevStory() {
        let prevIndex = currentIndex - 1
        if prevIndex >= 0 {
            currentIndex = prevIndex
            progress = CGFloat(prevIndex) / CGFloat(currentIndex)
        }
    }
    
    func resetTimer() {
        cancellable?.cancel()
        timer = Timer.publish(every: 0.05, on: .main, in: .common)
        cancellable = timer.connect()
    }
    
    func startTimer() {
        timer = Timer.publish(every: 0.05, on: .main, in: .common)
        cancellable = timer.connect()
    }
    
    func stopTimer() {
        cancellable?.cancel()
    }
}
