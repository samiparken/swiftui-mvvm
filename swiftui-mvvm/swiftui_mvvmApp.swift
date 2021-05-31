import SwiftUI

@main
struct swiftui_mvvmApp: App {
    
    @StateObject var todoManger = TodoListManager() //call by reference
    
    var body: some Scene {
        WindowGroup {
            TodoListView(todoManager: todoManger)
        }
    }
}
