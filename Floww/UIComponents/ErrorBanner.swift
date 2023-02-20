import SwiftUI

extension View {
    func errorBanner(message: String?) -> some View {
        modifier(ErrorModifier(message: message))
    }
}

private struct ErrorModifier: ViewModifier {
    let message: String?
    
    func body(content: Content) -> some View {
        if let message {
            ZStack(alignment: .bottom) {
                content
                ErrorView(message: message)
                    .padding(.horizontal, 16.0)
                    .transition(.move(edge: .bottom))
            }
        } else {
            content
        }
    }
}

private struct ErrorView: View {
    let message: String
    
    var body: some View {
        Text(message)
            .font(.callout.bold())
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(16.0)
            .background(Color.red)
            .cornerRadius(8.0)
    }
}

#if DEBUG
struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(message: "Lorem ipsum dolor sit amet vel iaculis congue lacus sagittis lectus pretium")
    }
}
#endif
