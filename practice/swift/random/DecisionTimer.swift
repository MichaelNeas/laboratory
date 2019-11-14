class DecisionTimer: UIView {
    var lineLayer = CAShapeLayer()
    let backgroundPath = UIBezierPath()
    let timerPath = UIBezierPath()
    
    override func draw(_ rect: CGRect) {
        backgroundPath.move(to: CGPoint(x: bounds.minX, y: frame.height / 2))
        backgroundPath.addLine(to: CGPoint(x: bounds.maxX, y: frame.height / 2))
        UIColor(hue: 360, saturation: 0.0, brightness: 1.0, alpha: 0.4).set()
        backgroundPath.lineWidth = 2
        backgroundPath.stroke()
        timerPath.move(to: CGPoint(x: bounds.minX, y: frame.height / 2))
        timerPath.addLine(to: CGPoint(x: bounds.maxX, y: frame.height / 2))
        lineLayer.path = timerPath.cgPath
        lineLayer.strokeColor = UIColor(hue: 360, saturation: 0.0, brightness: 1.0, alpha: 1.0).cgColor
        lineLayer.lineWidth = 2
        layer.addSublayer(lineLayer)
    }
    
    func animate(time: TimeInterval = 5.0) {
        let rightAnimation = CABasicAnimation(keyPath: "strokeEnd")
        rightAnimation.fromValue = 1.0
        rightAnimation.toValue = 0.5
        
        let leftAnimation = CABasicAnimation(keyPath: "strokeStart")
        leftAnimation.fromValue = 0.0
        leftAnimation.toValue = 0.5
        
        let group = CAAnimationGroup()
        group.animations = [leftAnimation,rightAnimation]
        group.duration = time
        group.isRemovedOnCompletion = false
        group.fillMode = .forwards
        group.autoreverses = false
        
        lineLayer.add(group, forKey: nil)
    }
}