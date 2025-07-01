/// You have a browser of one tab where you start on the homepage and you can visit another url, get back in the history number of steps or move forward in the history number of steps.
class BrowserHistory {

    private var history: [String]
    private var position = 0

    init(_ homepage: String) {
        self.history = [homepage]
    }
    
    func visit(_ url: String) {
        self.history = history[0...position] + [url]
        self.position = history.count - 1
    }
    
    func back(_ steps: Int) -> String {
        self.position = max(position - steps, 0)
        return history[position]
    }
    
    func forward(_ steps: Int) -> String {
        self.position = min(self.position + steps, self.history.count - 1)
        return history[position]
    }
}
