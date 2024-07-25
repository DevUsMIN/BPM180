//
//  MenuBarView.swift
//  BPM180
//
//  Created by Minkong on 7/6/24.
//

import SwiftUI

struct MenuBarView: View {
    @ObservedObject var viewModel: CategoryViewModel
    @Binding var isMenuOpen: Bool // @Binding으로 상태 전달 받기

    var body: some View {
        HStack {
            // 메뉴 열기 버튼
            Button(action: {
                withAnimation {
                    self.isMenuOpen.toggle() // 메뉴 열고 닫기 상태 전환
                }
            }) {
                Image(systemName: "line.horizontal.3")
                    .font(.system(size: 24))
                    .foregroundColor(.black)
            }
            
            // 카테고리 이름 표시
            Text("180BPM")
                .font(.headline)
                .foregroundColor(.black)
                .padding(.leading, 8)
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .shadow(radius: 1)
    }
}

struct MenuBarView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarView(viewModel: CategoryViewModel(), isMenuOpen: .constant(false))
    }
}
