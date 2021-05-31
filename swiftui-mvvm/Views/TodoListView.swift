import SwiftUI

struct TodoListView: View {
    //MARK: - PROPERTIES
    @ObservedObject var todoManager: TodoListManager
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            List {
                ForEach(todoManager.items) {item in
                    NavigationLink(
                        destination: Text("Destination \(item.name)"),
                        label: {
                            Text(item.name)
                        })
                }
                .onDelete(perform: { indexSet in
                    todoManager.delete(at: indexSet)
                    })
                .onMove(perform: { indices, newOffset in
                    todoManager.move(indices,newOffset)
                })
            }//:List
            .navigationBarTitle(Text("Todo's"), displayMode: .large)
            .toolbar(content:{
                ToolbarItemGroup(placement:.navigationBarTrailing){
                    EditButton()
                    Button(action: {
                        todoManager.addItem()
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            })
        }//:NavigationView
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            TodoListView(todoManager: TodoListManager())
            TodoListView(todoManager: TodoListManager())
        }
    }
}
