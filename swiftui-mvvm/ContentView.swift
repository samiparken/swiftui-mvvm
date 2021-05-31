import SwiftUI

struct Item: Identifiable {
    var id: UUID
    var name: String
}

struct ContentView: View {
    //MARK: - PROPERTIES
    /* @State property wrapper to allow us to modify values inside a struct */
    @State var items = [Item(id:UUID(),name:"First"),
                        Item(id:UUID(),name:"Second"),
                        Item(id:UUID(),name:"Third")]
    
    
    //MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) {item in
                    Text(item.name)
                }
                .onDelete(perform: { indexSet in
                    for index in indexSet {
                        items.remove(at:index)
                    }
                })
                .onMove(perform: { indices, newOffset in
                    items.move(fromOffsets: indices, toOffset: newOffset)
                })
            }//:List
            .navigationBarTitle(Text("Todo's"), displayMode: .large)
            .toolbar(content:{
                EditButton()
            })
        }//:NavigationView
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
