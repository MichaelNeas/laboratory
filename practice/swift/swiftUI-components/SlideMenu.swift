//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

fileprivate enum Constants {
    static let radius: CGFloat = 16
    static let imageFrame: CGFloat = 36
    static let snapRatio: CGFloat = 0.25
    static let minHeightRatio: CGFloat = 0.3
}

struct BottomSheetView: View {
    @State var isOpen: Bool = false

    let maxHeight: CGFloat
    let minHeight: CGFloat

    @GestureState private var translation: CGFloat = 0

    private var offset: CGFloat {
        isOpen ? 0 : maxHeight - minHeight
    }

    private var topContent: some View {
        HStack {
            RoundedRectangle(cornerRadius: Constants.radius / 4)
                .frame(
                    width: Constants.imageFrame,
                    height: Constants.imageFrame
                )
                .onTapGesture {
                    print("Change icon")
                }
            
            Text("Title text 2020-06-10").bold()
            .onTapGesture {
                print("Edit Text")
            }
            Spacer()
            Button( action: { self.isOpen = false }) {
                Image(systemName: "xmark")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color(red: 130/255, green: 130/255, blue: 134/255))
                    .padding(10.0)
                    .background(Circle().foregroundColor(Color(red: 228/255, green: 228/255, blue: 228/255)))
            }
        }
    }
    
    private var mainContent: some View {
        HStack(alignment: .center) {
            Spacer()
            Button(action: { print("camera") }) {
                Image(systemName: "camera.circle")
                    .font(.system(size: 48, weight: .thin))
                    .foregroundColor(Color(red: 130/255, green: 130/255, blue: 134/255))
            }
            Spacer()
            Button(action: { print("record") }) {
                Image(systemName: "mic.circle")
                    .font(.system(size: 64, weight: .thin))
                    .foregroundColor(Color(red: 130/255, green: 130/255, blue: 134/255))
                    .overlay(Circle().fill(Color(red: 176/255, green: 54/255, blue: 39/255)).opacity(0.85).scaleEffect(1.12).offset(x: 0.0, y: -0.2))
            }
            Spacer()
            Button(action: { print("pencil") }) {
                Image(systemName: "pencil.circle")
                .font(.system(size: 48, weight: .thin))
                .foregroundColor(Color(red: 130/255, green: 130/255, blue: 134/255))
            }
            Spacer()
        }.padding(.top, 30.0)
    }
        
    init(maxHeight: CGFloat) {
        self.minHeight = maxHeight * Constants.minHeightRatio
        self.maxHeight = maxHeight
    }

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                self.topContent.padding()
                Divider()
                self.mainContent
            }
            .frame(width: geometry.size.width, height: self.maxHeight, alignment: .top)
            .background(Color(.white))
            .cornerRadius(radius: Constants.radius, corners: [.topLeft, .topRight])
            .frame(height: geometry.size.height, alignment: .bottom)
            .offset(y: max(self.offset + self.translation, 0))
            .animation(.interactiveSpring())
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.height
                }.onEnded { value in
                    let snapDistance = self.maxHeight * Constants.snapRatio
                    guard abs(value.translation.height) > snapDistance else {
                        return
                    }
                    self.isOpen = value.translation.height < 0
                }
            )
        }.background(Color.black.opacity(1.0 - Double(self.offset + self.translation)/Double(self.maxHeight)))
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}


PlaygroundPage.current.setLiveView(BottomSheetView(maxHeight: 600))
