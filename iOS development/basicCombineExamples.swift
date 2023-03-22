import Combine
import Foundation

class ViewModel {
    @Published var text: String = "First"
    
    func setText(string: String) {
        self.text = string
    }
}

class Test1 { // Test 1: sink only the first initial setting of text
    let viewModel = ViewModel()
    func run() {
        viewModel.$text.first().sink { value in
            print("first:", value)
        }
        viewModel.setText(string: "New") // never calls the above sink
        viewModel.setText(string: "Text") // never calls the above sink
    }
}
Test1().run()

class Test2 { // Test 2: drop first
    let viewModel = ViewModel()
    func run() {
        viewModel.$text.dropFirst().sink { value in
            print("second:", value)
        }
        // both called
        viewModel.setText(string: "New") 
        viewModel.setText(string: "Text") 
    }
}
Test2().run()

class Test3 { // Test 3: cancel after first sink
    private let viewModel = ViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    func run() {
        viewModel.$text.sink { value in 
            print("third:", value)
        }.store(in: &cancellables) // 
        
        viewModel.setText(string: "New") // both called
        cancellables.removeAll()
        viewModel.setText(string: "Text") // never called in sink
    }
}
Test3().run()

class Test4 { // using Timer w/ Combine
    private var cancellables: Set<AnyCancellable> = []

    func run() {
        print("starting")
        Timer.publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .sink { value in
                print("Timer:", value)
            }
            .store(in: &cancellables)
    }
}
Test4().run() // works in xcode, seems playground doesn't like inf scripts