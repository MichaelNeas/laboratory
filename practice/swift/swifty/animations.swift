var branchTimer: UIProgressView!
DispatchQueue.main.async {
    UIView.animate(withDuration: 10.0, animations: { [weak self] in
        self?.branchTimer.setProgress(0.0, animated: true)
    }, completion: { finished in
        print("done \(finished)")
    })
}