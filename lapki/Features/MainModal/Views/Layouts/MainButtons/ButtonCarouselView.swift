import SwiftUI
import SwiftUIPager

let pages = [
    ModalButtonsSheetView(firstRow: [AnyView(
        MainModalButton(buttonType: .large, bgColor: Color.Paws.Content.yellow) {
            Text("Места для прогулок")
                .foregroundColor(Color.Paws.Constant.white)
                .font(.custom("Moloko", size: 48))
        } content: {
            Text("5 рядом с вами")
                .foregroundColor(Color.Paws.Constant.white)
        } image: {
            Image("dogImage")
        } action: {
            print("Tap")
        })], secondRow: [AnyView(
            MainModalButton(buttonType: .small, bgColor: Color.Paws.Content.pink) {
                Text("Ветклиники")
                    .foregroundColor(Color.Paws.Text.label)
                    .font(.custom("Moloko", size: 36))
            } content: {
                EmptyView()
            } image: {
                Image("dogImage")
            } action: {
                
            }
        ), AnyView(
            MainModalButton(buttonType: .tiny, bgColor: Color.Paws.Content.purple) {
                Text("Бешенство")
                    .foregroundColor(Color.Paws.Constant.white)
                    .bold()
                    .font(.custom("Moloko", size: 36))
            } content: {
                VStack {
                    Text("Подробности")
                        .foregroundStyle(Color.Paws.Text.label)
                    Text("Открыть")
                }
                .foregroundColor(Color.Paws.Constant.white)
            } action: {
                
            }
        )]),
    ModalButtonsSheetView(firstRow: [AnyView(
        MainModalButton(buttonType: .large, bgColor: Color.Paws.Content.green) {
            Text("Места для прогулок")
                .font(.custom("Moloko", size: 48))
                .foregroundColor(Color.Paws.Constant.white)
        } content: {
            Text("5 рядом с вами")
                .foregroundColor(Color.Paws.Constant.white)
        } image: {
            Image("dogImage")
        } action: {
            
        })], secondRow: [AnyView(
            MainModalButton(buttonType: .small, bgColor: Color.Paws.Content.yellow) {
                Text("Ветклиники")
                    .foregroundColor(Color.Paws.Text.label)
                    .font(.custom("Moloko", size: 36))
            } content: {
                EmptyView()
            } image: {
                Image("dogImage")
            } action: {
                
            }
        ), AnyView(
            MainModalButton(buttonType: .tiny, bgColor: Color.Paws.Content.pink) {
                Text("Бешенство")
                    .foregroundColor(Color.Paws.Constant.white)
                    .bold()
                    .font(.custom("Moloko", size: 36))
            } content: {
                VStack {
                    Text("Подробности")
                    Spacer()
                    Text("Открыть")
                }
                .foregroundColor(Color.Paws.Constant.white)
            } action: {
                
            }
        )])
    
]

struct ButtonCarouselView: View {
    @StateObject var page: Page = .first()
    @GestureState var isDragging: Bool = false
    @State private var isScrollable: Bool = true
    
    var body: some View {
        Pager(page: page, data: pages, id: \.id, content: { item in
            item
        })
        .pagingPriority(.high)
        .sensitivity(.high)
        .itemAspectRatio(0.99)
        .itemSpacing(12)
        .frame(height: 357)
    }
}
