
import SwiftUI

struct MyPageView: View {
    @ObservedObject var viewModel: UserViewModel

    var body: some View {
        VStack {
            Text("My Page")
                .font(.largeTitle)
            // 추가적인 My Page 내용
            Spacer()
        }
        .navigationTitle("My Page")
        .background(Color.white)
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView(viewModel: UserViewModel())
    }
}
