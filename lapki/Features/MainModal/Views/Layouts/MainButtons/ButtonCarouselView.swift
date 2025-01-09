import SwiftUI
import SwiftUIPager



struct ButtonCarouselView: View {
    @StateObject var page: Page = .first()
    @GestureState var isDragging: Bool = false
    @State private var isScrollable: Bool = true
    @ObservedObject var viewModel: MainModalViewModel
    
    var body: some View {
        Pager(page: page, data: viewModel.pages, id: \.id, content: { item in
            item
        })
        .pagingPriority(.high)
        .sensitivity(.high)
        .itemAspectRatio(0.99)
        .itemSpacing(12)
        .frame(height: 357)
    }
}
