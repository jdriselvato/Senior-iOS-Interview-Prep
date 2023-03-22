import Combine
import Foundation

class ViewModel {
    @Published var text: String = "Initial text"
    
    func setText(string: String) {
        self.text = string
    }
}



/// -- Test 1 sink only the first initial setting of text

class Test1 {
    let viewModel = ViewModel()
    func run() {
        viewModel.$text.first().sink { value in
            print("first:", value)
        }
        viewModel.setText(string: "Hello") // never calls the above sink
        viewModel.setText(string: "World") // never calls the above sink
    }
}
Test1().run()



/// -- Test 2 drop first

class Test2 {
    let viewModel = ViewModel()
    func run() {
        viewModel.$text.dropFirst().sink { value in
            print("second:", value)
        }
        // both called
        viewModel.setText(string: "Hello") 
        viewModel.setText(string: "World") 
    }
}
Test2().run()



/// -- Test 3 cancel after first sink

class Test3 {
    private let viewModel = ViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    func run() {
        viewModel.$text.sink { value in 
            print("third:", value)
        }.store(in: &cancellables) // 
        
        viewModel.setText(string: "Hello") // both called
        cancellables.removeAll()
        viewModel.setText(string: "World") // never called in sink
    }
}
Test3().run()



/// -- Test 4 using Timer w/ Combine

class Test4 { // 
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



/// -- Test 5 map and filter

class Test5 { // Test 1: sink only the first initial setting of text
    let viewModel = ViewModel()
    func run() {
        viewModel.$text
            .dropFirst()
            .filter { value in 
                return value != "Hello"
            }
            .map { value in 
                return "mapping w/ \(value)"
            }
            .sink { value in
                print("first:", value)
            }
        viewModel.setText(string: "Hello") // wont print because of filtering
        viewModel.setText(string: "World") 
    }
}
Test5().run()
