//: A UIKit based Playground for presenting user interface
  
import SwiftUI
import PlaygroundSupport

struct FlipEffect: GeometryEffect {
    func effectValue(size: CGSize) -> ProjectionTransform {
        let t = CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: size.height)
        return ProjectionTransform(t)
    }
}

struct Test: Hashable, Identifiable {
    let id = UUID()
    let name = "Test"
}

struct ContentView: View {
    @State var labels = Array(repeating: Test(), count: 100)
    
    var body: some View {
//        NavigationView {
//            List {
//                ForEach(labels) { item in
//                    Text(item.name)
//                        .modifier(FlipEffect())
//                }.onDelete(perform: delete)
//            }
//            .modifier(FlipEffect())
//            .navigationBarTitle("Test")
//            .navigationBarItems(trailing: EditButton())
//        }
        UIList(rows: generateRows())
    }
    
    func generateRows() -> [String] {
        (0..<100).reduce([]) { $0 + ["Row \($1)"] }
    }
    
    func delete(at offsets: IndexSet) {
        labels.remove(atOffsets: offsets)
    }
}


class HostingCell: UITableViewCell { // just to hold hosting controller
    var host: UIHostingController<AnyView>?
}

struct UIList: UIViewRepresentable {

    var rows: [String]

    func makeUIView(context: Context) -> UITableView {
        let collectionView = UITableView(frame: .zero, style: .plain)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = context.coordinator
        collectionView.delegate = context.coordinator
        collectionView.register(HostingCell.self, forCellReuseIdentifier: "Cell")
        return collectionView
    }

    func updateUIView(_ uiView: UITableView, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(rows: rows)
    }

    class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate {

        var rows: [String]

        init(rows: [String]) {
            self.rows = rows
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            self.rows.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HostingCell

            let view = Text(rows[indexPath.row])
                    .frame(height: 50).background(Color.blue)

            // create & setup hosting controller only once
            if tableViewCell.host == nil {
                let controller = UIHostingController(rootView: AnyView(view))
                tableViewCell.host = controller

                let tableCellViewContent = controller.view!
                tableCellViewContent.translatesAutoresizingMaskIntoConstraints = false
                tableViewCell.contentView.addSubview(tableCellViewContent)
                tableCellViewContent.topAnchor.constraint(equalTo: tableViewCell.contentView.topAnchor).isActive = true
                tableCellViewContent.leftAnchor.constraint(equalTo: tableViewCell.contentView.leftAnchor).isActive = true
                tableCellViewContent.bottomAnchor.constraint(equalTo: tableViewCell.contentView.bottomAnchor).isActive = true
                tableCellViewContent.rightAnchor.constraint(equalTo: tableViewCell.contentView.rightAnchor).isActive = true
            } else {
                // reused cell, so just set other SwiftUI root view
                tableViewCell.host?.rootView = AnyView(view)
            }
            tableViewCell.setNeedsLayout()
            return tableViewCell
        }
    }
}

PlaygroundSupport.PlaygroundPage.current.setLiveView(ContentView())
