//
//  ViewController.swift
//  MotionPanning
//
//  Created by Michael Neas on 4/22/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    private let motion = CMMotionManager()
    
    var centerZoomed: CGRect {
        CGRect(x: 200, y: 200, width: imageView.frame.width - 400, height: imageView.frame.height - 400)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentSize = imageView.bounds.size
        scrollView.contentInsetAdjustmentBehavior = .never
        setZoomScale()
        scrollView.zoom(to: centerZoomed, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startDeviceMotion()
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
    
    func setZoomScale() {
        let widthScale = scrollView.frame.size.width / imageView.bounds.width
        let heightScale = scrollView.frame.size.height / imageView.bounds.height
        let minScale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 3.0
        //scrollView.contentInsetAdjustmentBehavior = .
    }
    
    private func startDeviceMotion() {
        guard motion.isDeviceMotionAvailable else { return }

        motion.deviceMotionUpdateInterval = 0.1
        motion.showsDeviceMovementDisplay = true
        motion.startDeviceMotionUpdates(using: .xArbitraryZVertical, to: .main) { [weak self] (motion, _) in
            guard let self = self, let data = motion else { return }
            let quat = data.attitude.quaternion
            
            let qPitch = CGFloat((atan2(2 * (quat.x * quat.w + quat.y * quat.z), 1 - 2 * quat.x * quat.x - 2 * quat.z * quat.z)))
            let qRoll = CGFloat(atan2(2*(quat.y*quat.w - quat.x*quat.z), 1 - 2*quat.y*quat.y - 2*quat.z*quat.z))
            
            //print("roll: \(qRoll), pitch: \(cos(qPitch - CGFloat.pi/4))")
            
            self.scrollView.setContentOffset(CGPoint(x: self.scrollView.contentOffset.x - CGFloat(qRoll * 64), y: self.scrollView.contentOffset.y + CGFloat(cos(qPitch + CGFloat.pi/4) * 64
                )), animated: true)
        }
    }
}
