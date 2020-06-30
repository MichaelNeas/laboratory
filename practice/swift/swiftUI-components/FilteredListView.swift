import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var data = [
        Content(name: "Hard hat", date: "June 10, 2020", background: .blue, initials: "JM"),
        Content(name: "Pipe", date: "June 10, 2020", background: .red, initials: "JM"),
        Content(name: "Cable box", date: "June 7, 2020", background: .green, initials: "JM"),
        Content(name: "Brick wall", date: "June 6, 2020", background: .black, initials: "JC"),
    ]
    
    var body: some View {
        ZStack {
            List(data) { content in
                Cell(content: content)
            }
            VStack {
                HStack(alignment: .center) {
                    Spacer()
                    Image(systemName: "xmark.circle")
                        .padding()
                }
                .frame(height: 80.0)
                .background(Blur(style: .systemThinMaterial))
                Spacer()
                FilterBar()
                    .padding(.bottom, 40.0)
            }
        }
    }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

struct FilterBar: View {
    @State var selected: BarState = .all
    
    enum BarState: String, CaseIterable {
        case all = "All"
        case recent = "Recent"
        case scanned = "Scanned"
    }
    
    var body: some View {
        HStack {
            ForEach(BarState.allCases, id: \.self) { val in
                Text(val.rawValue)
                    .fontWeight(.semibold)
                    .padding(10.0)
                    .padding([.trailing, .leading], 10)
                    .background(self.selected == val ? Color(red: 44/255, green: 44/255, blue: 44/255).opacity(0.42) : .clear)
                    .foregroundColor(self.selected == val ? .white : .gray)
                    .cornerRadius(20.0)
                    .onTapGesture {
                        self.selected = val
                    }
                    .padding([.trailing, .leading], 6)
            }
        }
        .padding(4.0)
        .background(Blur(style: .extraLight))
        .cornerRadius(30.0)
    }
}

struct Cell: View {
    let content: Content
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(content.background)
                .frame(height: 160.0)
            VStack {
                HStack(alignment: .center) {
                    Text(content.initials)
                        .padding(5)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .clipped()
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text(content.date)
                        Text(content.name)
                            .fontWeight(.bold)
                    }
                    Spacer()
                }.padding()
                .background(Color.white)
                .opacity(0.9)
                Spacer()
            }
        }
    }
}

struct Content: Identifiable {
    let id = UUID()
    let name: String
    let date: String
    let background: Color
    let initials: String
}

PlaygroundPage.current.setLiveView(ContentView())
