import SwiftUI

struct MenuPicker: View {
    
    struct Choice: Identifiable, Hashable {
        let id: String
        let title: String
    }
    
    let choices: [Choice]
    @Binding var selected: Choice?
    
    @Namespace private var ns
    
    var body: some View {
        HStack(alignment: .bottom) {
            ForEach(choices) { choice in
                Button(action: {
                    withAnimation(.easeOut(duration: 0.3)) {
                        selected = choice
                    }
                }) {
                    Text(choice.title)
                        .font(.system(size: 18, weight: Font.Weight.medium))
                        .foregroundColor(color(for: choice))
                        .padding(.bottom, 5)
                        .background(
                            Color.clear
                                .frame(height: 3)
                                .matchedGeometryEffect(id: choice.id, in: ns, properties: .frame, isSource: true)
                                .frame(maxHeight: .infinity, alignment: .bottom)
                        )
                }
            }
        }
        .overlay(selectionBar)
    }
    
    @ViewBuilder
    private var selectionBar: some View {
        if let selected = selected {
            Capsule()
                .fill(Color("SelectedColor"))
                .matchedGeometryEffect(id: selected.id, in: ns, properties: .frame, isSource: false)
        }
    }
    
    private func color(for choice: Choice) -> Color {
        selected == choice
            ? Color("SelectedColor")
            : Color("DefaultColor")
    }
}

struct MenuPicker_Previews: PreviewProvider {
    static private let choices = [
        MenuPicker.Choice(id: UUID().uuidString, title: "Home"),
        MenuPicker.Choice(id: UUID().uuidString, title: "Pictures"),
        MenuPicker.Choice(id: UUID().uuidString, title: "Videos"),
        MenuPicker.Choice(id: UUID().uuidString, title: "Documentation")
    ]
    
    static var previews: some View {
        MenuPicker(
            choices: choices,
            selected: .constant(choices[0])
        )
    }
}
