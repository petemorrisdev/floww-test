import SwiftUI

struct StandardImage: View {
    let image: URL
    let size: CGSize
    
    var body: some View {
        AsyncImage(
            url: image,
            transaction: Transaction(animation: .default)
        ) { phase in
            
            switch phase {
            case let .success(image):
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                
            default:
                Color.clear
                    .frame(width: size.width, height: size.height)
            }
            
        }
    }
}
