import SwiftUI

// 메트로놈 뷰 구조체 정의
struct MetronomeView: View {
    @ObservedObject var viewModel: MetronomeViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                CircleIndicators(activeIndex: viewModel.activeCircle)
                Spacer()
                TempoControlView(viewModel: viewModel)
            }
        }
    }
}

// 원 인디케이터 뷰
struct CircleIndicators: View {
    let activeIndex: Int
    
    var body: some View {
        HStack {
            ForEach(0..<4) { index in
                Circle()
                    .fill(index == activeIndex ? Color.basecolor : Color.gray)
                    .frame(width: 50, height: 50)
                    .animation(.easeInOut(duration: 0.1), value: activeIndex)
                    .padding(15)
            }
        }
    }
}

// 템포 조절 및 실행 버튼 뷰
struct TempoControlView: View {
    @ObservedObject var viewModel: MetronomeViewModel
    
    var body: some View {
        VStack {
            TempoControlButtons(viewModel: viewModel)
            PlayPauseButton(isRunning: viewModel.isRunning, action: toggleMetronome)
        }
        .frame(maxWidth: .infinity, maxHeight: 300)
        .background(Color.basecolor)
    }
    
    private func toggleMetronome() {
        if viewModel.isRunning {
            viewModel.isRunning = false
            viewModel.stopTimer()
        } else {
            viewModel.isRunning = true
            viewModel.startTimer()
        }
    }
}

// 템포 조절 버튼과 현재 템포를 표시하는 뷰
struct TempoControlButtons: View {
    @ObservedObject var viewModel: MetronomeViewModel
    
    var body: some View {
        HStack {
            Button(action: {
                viewModel.decreaseTempo()
            }) {
                Image(systemName: "minus")
                    .foregroundColor(.white)
                    .padding()
            }
            
            Text("\(viewModel.tempo)")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
            
            Button(action: {
                viewModel.increaseTempo()
            }) {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .gesture(DragGesture().onChanged { value in
            let translation = value.translation.width
            if abs(translation) > 10 {
                if translation > 10 {
                    viewModel.increaseTempo()
                } else if translation < -10 {
                    viewModel.decreaseTempo()
                }
            }
        })
    }
}

// 재생/일시 정지 버튼 뷰
struct PlayPauseButton: View {
    let isRunning: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: isRunning ? "square.fill" : "play.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .padding(30)
                .foregroundColor(.basecolor)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(radius: 3)
        }
        .padding()
    }
}

// 프리뷰를 위한 코드
struct MetronomeView_Previews: PreviewProvider {
    static var previews: some View {
        MetronomeView(viewModel: MetronomeViewModel())
    }
}

