//
//  TableViewRepresentable.swift
//  SwiftUITableView
//
//  Created by Michael Neas on 11/23/20.
//

import SwiftUI

final class TableViewRepresentable: UIViewControllerRepresentable {
    // MARK: Properties and initializer
    let post: String
    @Binding var comments: [String]
    @Binding var isEditing: Bool

    var vc: UITableViewController?

    init(_ comments: Binding<[String]>, post: String, isEditing: Binding<Bool>) {
        self._comments = comments
        self.post = post
        self._isEditing = isEditing
    }

    // MARK: UIViewControllerRepresentable
    typealias UIViewControllerType = UITableViewController

    func makeUIViewController(context: Context) -> UITableViewController {
        let tvc = UITableViewController()
        tvc.tableView.delegate = context.coordinator
        tvc.tableView.dataSource = context.coordinator

        tvc.tableView.rowHeight = UITableView.automaticDimension
        tvc.tableView.estimatedRowHeight = UITableView.automaticDimension
        tvc.tableView.separatorStyle = .none
        tvc.tableView.allowsSelection = false
        //tvc.tableView.allowsSelectionDuringEditing = true
        //tvc.tableView.allowsMultipleSelectionDuringEditing = true

        self.vc = tvc
        return tvc
    }

    func updateUIViewController(_ uiViewController: UITableViewController, context: Context) {
        uiViewController.tableView.reloadData()
        uiViewController.setEditing(isEditing, animated: true)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // MARK: - Coordinator
    class Coordinator: NSObject, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {

        // MARK: Properties and initializer
        private let parent: TableViewRepresentable

        init(_ parent: TableViewRepresentable) {
            self.parent = parent
        }

        // MARK: UITableViewDelegate and DataSource methods
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return parent.comments.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return createCommentCell(indexPath, tableView)
        }

        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            UITableView.automaticDimension
        }

        var cellHeights = [IndexPath: CGFloat]()

        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            cellHeights[indexPath] = cell.frame.size.height
        }

        func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return cellHeights[indexPath] ?? UITableView.automaticDimension
        }

        // MARK: - Private helpers
        fileprivate func createCommentCell(_ indexPath: IndexPath, _ tableView: UITableView) -> UITableViewCell {
            let comment = parent.comments[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "DebugCell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "DebugCell")
            let textview = UITextView()
            textview.text = comment
            textview.isScrollEnabled = false
            textview.dataDetectorTypes = [.link]
            textview.isEditable = false
            textview.delegate = self
            textview.textContainer.lineBreakMode = .byWordWrapping
            cell.contentView.addSubview(textview)
            textview.translatesAutoresizingMaskIntoConstraints = false
            textview.sizeToFit()
            let constraints = [
                textview.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
                textview.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor),
                textview.topAnchor.constraint(equalTo: cell.contentView.topAnchor),
                textview.bottomAnchor.constraint(equalTo: cell.contentView.bottomAnchor)
            ]
            NSLayoutConstraint.activate(constraints)
            return cell
        }
        
        func textViewDidChange(_ textView: UITextView) {
            parent.vc?.tableView.beginUpdates()
            parent.vc?.tableView.endUpdates()
        }
    }
}
