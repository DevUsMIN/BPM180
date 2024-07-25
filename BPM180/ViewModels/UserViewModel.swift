//
//  UserViewModel.swift
//  BPM180
//
//  Created by Minkong on 7/6/24.
//


import Combine

// UserViewModel은 사용자 데이터를 관리합니다.
class UserViewModel: ObservableObject {
    @Published var user: User = User(name: "John Doe", email: "john.doe@example.com")
    
    // 사용자 정보를 업데이트하는 메소드입니다.
    func updateUser(name: String, email: String) {
        user.name = name
        user.email = email
    }
}
