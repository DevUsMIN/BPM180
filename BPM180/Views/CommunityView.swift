//
//  CommunityView.swift
//  BPM180
//
//  Created by Minkong on 7/6/24.
//

import SwiftUI

// CommunityView는 커뮤니티 게시글 목록 UI를 담당합니다.
struct CommunityView: View {
    @ObservedObject var viewModel: CommunityViewModel

    var body: some View {
        // 게시글을 리스트로 표시합니다.
        List(viewModel.posts) { post in
            VStack(alignment: .leading) {
                Text(post.title).font(.headline)
                Text(post.content).font(.subheadline)
            }
        }
        .onAppear {
            viewModel.loadPosts()
        }
    }
}

// 프리뷰를 위한 코드
struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView(viewModel: CommunityViewModel())
    }
}
