# MenuPicker

Description: An animated menu picker in SwiftUI, using MatchedGeometryEffects.

![Menu Picker](./menupicker.gif)

### Usage

Define a liste of `MenuPicker.Choice`

```swift
private let choices = [
  MenuPicker.Choice(id: UUID().uuidString, title: "Home"),
  MenuPicker.Choice(id: UUID().uuidString, title: "Pictures"),
  MenuPicker.Choice(id: UUID().uuidString, title: "Videos"),
  MenuPicker.Choice(id: UUID().uuidString, title: "Documentation")
]
```



Define a state variable for the selected value

```swift
@State private var selectedChoice: MenuPicker.Choice?
```



Call the `MenuPicker` View with these properties

```swift
MenuPicker(
  choices: choices,
  selected: $selectedChoice
)
```

