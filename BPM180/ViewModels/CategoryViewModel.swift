import SwiftUI

// `CategoryViewModel` 정의
class CategoryViewModel: ObservableObject {
    @Published var categories: [Category] = [] // 카테고리 목록
    @Published var selectedCategory: Category? // 선택된 카테고리
    
    init() {
        // 샘플 데이터 초기화
        categories = [
            Category(id: 1, name: "Category 1"),
            Category(id: 2, name: "Category 2"),
            Category(id: 3, name: "Category 3")
        ]
    }
}

