import Foundation

class TodoListManager: ObservableObject {
    /* @Published is one of the most useful property wrappers in SwiftUI, allowing us to create observable objects that automatically announce when changes occur. */
    @Published var items: [Item] = [Item(id:UUID(),name:"First"),
                                    Item(id:UUID(),name:"Second"),
                                    Item(id:UUID(),name:"Third")]
    init() {
        //get my data and set to my items array
        
    }
    
    func move(_ indices: IndexSet, _ newOffset: Int) {
        items.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func addItem() {
        items.append(Item(id: UUID(), name: "newly added"))
    }
    
    func delete(at indexSet: IndexSet) {
        for index in indexSet {
            items.remove(at:index)
        }
    }
}
