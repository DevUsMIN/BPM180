//
//  AuthViewModel.swift
//  BPM180
//
//  Created by Minkong on 7/6/24.
//



import Combine

// AuthViewModel은 사용자 인증 데이터를 관리합니다.
class AuthViewModel: ObservableObject {
    @Published var authData: AuthData = AuthData(email: "", password: "")
    @Published var isAuthenticated: Bool = false

    // 사용자를 로그인하는 메소드입니다.
    func login(email: String, password: String) {
        // 여기에 실제 로그인 로직을 추가해야 합니다.
        self.isAuthenticated = true
    }
    
    // 사용자를 회원가입하는 메소드입니다.
    func signUp(email: String, password: String) {
        // 여기에 실제 회원가입 로직을 추가해야 합니다.
        self.isAuthenticated = true
    }

    // 소셜 로그인 처리 메소드입니다.
    func socialLogin(provider: String) {
        // 여기에 실제 소셜 로그인 로직을 추가해야 합니다.
        self.isAuthenticated = true
    }
}
