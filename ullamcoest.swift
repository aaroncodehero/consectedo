import SwiftUI

struct ContentView: View {
    @State private var frame: CGRect = .zero
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .background(GeometryReader { geometry in
                    Color.clear
                        .onAppear {
                            let namedSpace = geometry.frame(in: .named("namedSpace"))
                            self.frame = namedSpace
                        }
                })
            
            Text("Frame: \(frame)")
                .padding()
        }
        .coordinateSpace(name: "namedSpace")
    }
}

