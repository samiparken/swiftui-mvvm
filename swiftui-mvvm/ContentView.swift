import SwiftUI

struct Item: Identifiable {
    var id: UUID
    var name: String
}

struct ContentView: View {
    //MARK: - PROPERTIES
    @State var items = [Item(id:UUID(),name:"First"),
                 Item(id:UUID(),name:"Second"),
                 Item(id:UUID(),name:"Third")]
    
    /*
     @State property wrapper to allow us to modify values inside a struct,
     */
    
    
    //MARK: - BODY
    
    var body: some View {
        List {
            ForEach(items) {item in
                Text(item.name)
            }
            .onDelete(perform: { indexSet in
                for index in indexSet {
                    items.remove(at:index)
                }
            })
        }
    }
}

//MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
