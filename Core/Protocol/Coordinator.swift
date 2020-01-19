import Foundation

import Foundation

public protocol CoordinatorDelegate: class {
    func didFinish(coordintor: Coordinator)
}

public protocol Coordinator: class {
    func start()
}
