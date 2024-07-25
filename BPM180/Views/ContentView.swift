import SwiftUI

struct ContentView: View {
    @StateObject var metronomeViewModel = MetronomeViewModel()
    @StateObject var userViewModel = UserViewModel()
    @StateObject var categoryViewModel = CategoryViewModel()
    
    @State private var isMenuOpen = false // 사이드 메뉴 열림/닫힘 상태

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.basecolor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    Spacer()
                    Text("미 구현 영역")
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.1))
                .navigationBarTitle("180BPM", displayMode: .inline)
                .navigationBarItems(
                    leading: Button(action: {
                        withAnimation(.easeInOut) {
                            isMenuOpen.toggle() // 사이드 메뉴 열기/닫기
                        }
                    }) {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.white)
                    },
                    trailing: NavigationLink(destination: MyPageView(viewModel: userViewModel)) {
                        Image(systemName: "person")
                            .foregroundColor(.white)
                    }
                )
            }
            
            // 사이드 메뉴
            if isMenuOpen {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isMenuOpen = false // 사이드 메뉴 닫기
                        }
                    }
                
                MenuView(viewModel: categoryViewModel, isMenuOpen: $isMenuOpen)
                    .frame(width: 300) // 사이드 메뉴의 너비
                    .background(Color.white)
                    .offset(x: isMenuOpen ? -70: -250) // 사이드 메뉴 위치 조정
                    .transition(.move(edge: .leading)) // 슬라이드 애니메이션
                    .animation(.easeInOut) // 애니메이션 적용
                    .zIndex(1) // 네비게이션 바 위에 쌓이도록 설정
            }
        }
        .edgesIgnoringSafeArea(.all) // SafeArea 무시하여 화면 전체에 메뉴 버튼 배치
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

