//
//  CommunityViewModel.swift
//  BPM180
//
//  Created by Minkong on 7/6/24.
//


import Combine

// CommunityViewModel은 커뮤니티 게시글 데이터를 관리합니다.
class CommunityViewModel: ObservableObject {
    @Published var posts: [Post] = []
    
    // 게시글을 로드하는 메소드입니다.
    func loadPosts() {
        posts = [
            Post(id: 1, title: "First Post", content: "This is the first post."),
            Post(id: 2, title: "Second Post", content: "This is the second post.")
        ]
    }
}

