import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.authData.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("Password", text: $viewModel.authData.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            NavigationLink(destination: ContentView()) {
                Button(action: {
                    
    
                }, label: {
                    Text("Login")
                        .foregroundColor(.mint)
                })
            }
            .padding()
            
            NavigationLink(destination: SignUpView(viewModel: viewModel)) {
                Button(action: {
                    
                }, label: {
                    Text("Sign Up")
                        .foregroundColor(.mint)
                })
            }
            .padding()
            
            Button(action: {
                viewModel.socialLogin(provider: "Google")
            }) {
                Text("Login with Goole")
                    .foregroundColor(.mint)
            }
            .padding()
            
            Button(action: {
                viewModel.socialLogin(provider: "Kakao")
            }) {
                Text("Login with Kakao")
                    .foregroundColor(.mint)
            }
            .padding()
            
            Button(action: {
                viewModel.socialLogin(provider: "Naver")
            }) {
                Text("Login with Naver")
                    .foregroundColor(.mint)
            }
            .padding()
            
            Button(action: {
                viewModel.socialLogin(provider: "Apple")
            }) {
                Text("Login with Apple")
                    .foregroundColor(.mint)
            }
            .padding()



        }
        .navigationTitle("Login")
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        // 여기서 ViewModel의 인스턴스를 생성
        LoginView(viewModel: AuthViewModel())
    }
}

