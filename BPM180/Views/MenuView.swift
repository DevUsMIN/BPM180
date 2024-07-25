import SwiftUI

struct MenuView: View {
    @ObservedObject var viewModel: CategoryViewModel
    @Binding var isMenuOpen: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(viewModel.categories) { category in
                Button(action: {
                    viewModel.selectedCategory = category
                    withAnimation {
                        isMenuOpen = false // 메뉴 항목 클릭 시 메뉴 닫기
                    }
                }) {
                    Text(category.name)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .foregroundColor(.black)
                        .background(.gray.opacity(0.3))
                        .cornerRadius(15)
                }
            }
            Spacer()
        }
        Spacer()
        .background(Color.white)
        .frame(maxWidth: 250, maxHeight: .infinity, alignment: .center)
        .edgesIgnoringSafeArea(.vertical) // 세로 방향으로 SafeArea 무시
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(viewModel: CategoryViewModel(), isMenuOpen: .constant(true))
    }
}

