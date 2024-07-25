//
//  SignUpView.swift
//  BPM180
//
//  Created by Minkong on 7/6/24.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel: AuthViewModel

    var body: some View {
        VStack {
            TextField("Email", text: $viewModel.authData.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("Password", text: $viewModel.authData.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                viewModel.signUp(email: viewModel.authData.email, password: viewModel.authData.password)
            }) {
                Text("Sign Up")
            }
            .padding()
        }
        .navigationTitle("Sign Up")
    }
}

// 프리뷰를 위한 코드
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: AuthViewModel())
    }
}
