import SwiftUI

struct ContentView: View {
    
    private let choices = [
        MenuPicker.Choice(id: UUID().uuidString, title: "Home"),
        MenuPicker.Choice(id: UUID().uuidString, title: "Pictures"),
        MenuPicker.Choice(id: UUID().uuidString, title: "Videos"),
        MenuPicker.Choice(id: UUID().uuidString, title: "Documentation")
    ]
    
    @State private var selectedChoice: MenuPicker.Choice?
    
    var body: some View {
        VStack {
            MenuPicker(
                choices: choices,
                selected: $selectedChoice
            )
        }
        .onAppear {
            selectedChoice = choices[0]
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
