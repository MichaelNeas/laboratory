//FilterSelection(options: options, onSelect: { print($0) })

struct DropdownOption: Hashable {
    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.key == rhs.key
    }
    var key: String
    var val: String
}


struct FilterDropdownOptionElement: View {
    var val: String
    var key: String
    @Binding var selected: String
    var onSelect: ((_ key: String) -> Void)?

    var body: some View {
        Button(action: {
            selected = key
            self.onSelect?(self.key)
        }) {
            HStack {
                Spacer()
                Text(self.val)
                    .font(.system(size: 16, weight: selected == self.key ? .medium : .regular))
                    .foregroundColor(selected == self.key ? Color(red: 55/255, green: 151/255, blue: 255/255) : Color(red: 49/255, green: 54/255, blue: 60/255))
                Spacer()
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

struct FilterDropDown: View {
    var options: [DropdownOption]
    @Binding var selected: String
    var onSelect: ((_ key: String) -> Void)?

    var body: some View {
        List(self.options, id: \.self) { option in
            FilterDropdownOptionElement(val: option.val, key: option.key, selected: $selected, onSelect: self.onSelect)
        }
        .frame(width: UIScreen.main.bounds.width / 1.3, height: min(CGFloat(options.count) * 44.0, 200.0))
        .background(Rectangle().fill(Color.white))
        .cornerRadius(5)
        .shadow(radius: 4, x: 2, y: 5)
        .padding(.trailing, 18)
    }
}

struct FilterSelection: View {
    @State var showPopup = false
    @State var selected = ""
    let buttonHeight: CGFloat = 44
    var options: [DropdownOption]
    var onSelect: ((_ key: String) -> Void)?
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: { showPopup.toggle() }) {
                Text("View ").font(.system(size: 12)).foregroundColor(Color(red: 49/255, green: 54/255, blue: 60/255)) + Text("All").font(.system(size: 14, weight: .medium))
            }
        }.padding()
        .overlay(
            VStack(alignment: .trailing, spacing: 0) {
                if self.showPopup {
                    Spacer(minLength: buttonHeight)
                    FilterDropDown(options: self.options, selected: $selected, onSelect: self.onSelect)
                }
            }, alignment: .topTrailing
        )
    }
}