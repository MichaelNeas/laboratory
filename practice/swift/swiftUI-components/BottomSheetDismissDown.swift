struct BottomSheet: View {
    @GestureState private var offset: CGFloat = 0
    @Binding var presented: Bool
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center) {
                HStack(alignment: .top) {
                    Spacer()
                    Capsule()
                        .fill(Color(red: 70/255, green: 69/255, blue: 69/255))
                        .frame(width: 100, height: 5)
                        .padding()
                    Spacer()
                }
                Spacer()
                Text("Private Content")
                Spacer()
            }.frame(height: proxy.size.height / 2.5)
            .background(Color.white)
            .cornerRadius(radius: 20, corners: [.topLeft, .topRight])
            .offset(y: proxy.frame(in: .global).height - (proxy.size.height / 3))
            .offset(y: offset)
            .gesture(DragGesture().updating(self.$offset) { value, state, _ in
                print(value.translation)
                // don't allow drag beyond max
                if value.translation.height > 0 {
                    state = value.translation.height
                }
            }.onEnded { value in
                if value.predictedEndTranslation.height > 160 {
                    presented = false
                }
            })
        }
    }
}