//
//  Post.swift
//  BPM180
//
//  Created by Minkong on 7/6/24.
//


// Post 모델은 커뮤니티 게시글의 데이터를 나타냅니다.
struct Post: Identifiable {
    let id: Int
    let title: String
    let content: String
}

