//
//  AutoLayoutViewController.swift
//  GuessThatFlag
//
//  Created by Michael Neas on 8/28/19.
//  Copyright © 2019 Michael Neas. All rights reserved.
//

import UIKit

class AutoLayoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label1 = UILabel()
        // we have to make our constraints by hand
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.backgroundColor = .red
        label1.text = "THESE"
        // show the label at default fault and fill the space
        label1.sizeToFit()
        
        let label2 = UILabel()
        label2.translatesAutoresizingMaskIntoConstraints = false
        label2.backgroundColor = .cyan
        label2.text = "ARE"
        label2.sizeToFit()
        
        let label3 = UILabel()
        label3.translatesAutoresizingMaskIntoConstraints = false
        label3.backgroundColor = .yellow
        label3.text = "SOME"
        label3.sizeToFit()
        
        let label4 = UILabel()
        label4.translatesAutoresizingMaskIntoConstraints = false
        label4.backgroundColor = .green
        label4.text = "AWESOME"
        label4.sizeToFit()
        
        let label5 = UILabel()
        label5.translatesAutoresizingMaskIntoConstraints = false
        label5.backgroundColor = .orange
        label5.text = "LABELS"
        label5.sizeToFit()
        
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        view.addSubview(label5)
        
        /// https://www.hackingwithswift.com/articles/140/the-auto-layout-cheat-sheet
        // visual format language
//        let viewsDictionary = ["label1": label1,"label2": label2,"label3": label3,"label4": label4,"label5": label5]
//        for label in viewsDictionary.keys {
//            // "H:|[\(label)]|" describes how we want our layout to look, H means horizonal layout, | means edge of view, [ edges of view
//            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(label)]|", options: [], metrics: nil, views: viewsDictionary))
//        }
        // - means space, 10 points by default
        // (==88) size must be 80 points
        // (>=10) greater than 10 before the end of the view
        // metrics can be sizes with names
        // 1000 is highest required priority, @999 will say super high priority but not highest
        // label1 references the height of label1
//        let metrics = ["labelHeight": 88]
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]-(>=10)-|", options: [], metrics: metrics, views: viewsDictionary))
        // A pipe symbol in Visual Formatting Language means the edge of the parent view.
        // left and leading are the same, right and trailing are the same in left to right languages
        var previous: UILabel?
        
        for label in [label1, label2, label3, label4, label5] {
            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                label.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2, constant: -10)
            ])
//            label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//            label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//
            if let previous = previous {
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10.0).isActive = true
            } else {
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.0).isActive = true
            }
            previous = label
        }
    }
}
