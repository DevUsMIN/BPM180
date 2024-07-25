import SwiftUI

// SplashView: 앱 시작 화면
struct SplashView: View {
    @State private var isLaunching: Bool = true
    @State private var opacity: Double = 1.0
    
    var body: some View {
        ZStack {
            if isLaunching {
                LoadingView(opacity: $opacity)
                    .onAppear {
                        handleAnimation()
                    }
            } else {
                ContentView()
            }
        }
        .navigationBarHidden(true)
    }
    
    private func handleAnimation() {
        withAnimation(.easeIn(duration: 1.0)) {
            opacity = 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            isLaunching = false
        }
    }
}

// LoadingView: 로딩 화면
struct LoadingView: View {
    @Binding var opacity: Double
    
    var body: some View {
        ZStack {
            Color.basecolor
                .ignoresSafeArea()
            Image("LOGO")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .opacity(opacity)
        }
    }
}

// PreviewProvider: 미리보기
struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}


