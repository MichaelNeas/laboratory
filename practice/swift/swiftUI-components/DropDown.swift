//
//  ContentView.swift
//  DropDown
//
//  Created by Michael Neas on 10/26/20.
//

import SwiftUI

struct ContentView: View {
    let options = [DropdownOption(key: "1", val: "First"), DropdownOption(key: "2", val: "Second")]
    var body: some View {
        DropdownButton(shouldShowDropdown: false, displayText: .constant("Select Project"), options: options, onSelect: { print($0) })
    }
}
struct DropdownOption: Hashable {
    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.key == rhs.key
    }
    var key: String
    var val: String
}

struct DropdownOptionElement: View {
    var val: String
    var key: String
    @Binding var selected: String
    var onSelect: ((_ key: String) -> Void)?

    var body: some View {
        Button(action: {
            if let onSelect = self.onSelect {
                selected = self.key
                onSelect(self.key)
            }
        }) {
            HStack {
                Text(self.val)
                    .font(.system(size: 16, weight: selected == self.key ? .medium : .regular))
                    .foregroundColor(Color(red: 49/255, green: 54/255, blue: 60/255))
                Spacer()
                if selected == self.key {
                    Image(systemName: "checkmark")
                        .font(.system(size: 14, weight: .heavy))
                        .foregroundColor(Color(red: 55/255, green: 151/255, blue: 255/255))
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
    }
}

struct Dropdown: View {
    var options: [DropdownOption]
    @Binding var selected: String
    var onSelect: ((_ key: String) -> Void)?

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(self.options, id: \.self) { option in
                DropdownOptionElement(val: option.val, key: option.key, selected: $selected, onSelect: self.onSelect)
            }
        }
        .background(Rectangle().fill(Color.white))
        .cornerRadius(radius: 5, corners: [.bottomLeft, .bottomRight])
        .shadow(radius: 4, x: 2, y: 5)
    }
}
struct DropdownButton: View {
    @State var shouldShowDropdown = false
    @State var selected = ""
    @Binding var displayText: String
    var options: [DropdownOption]
    var onSelect: ((_ key: String) -> Void)?

    let buttonHeight: CGFloat = 30
    var body: some View {
        Button(action: {
            withAnimation {
                self.shouldShowDropdown.toggle()
            }
        }) {
            HStack {
                Text(displayText)
                    .font(.system(size: 16))
                    .foregroundColor(Color(red: 90/255, green: 112/255, blue: 136/255))
                Spacer()
                    .frame(width: 20)
                Image(systemName: self.shouldShowDropdown ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    .font(.system(size: 7))
                    .foregroundColor(Color(red: 72/255, green: 80/255, blue: 90/255))
            }
        }
        .padding(.horizontal)
        .cornerRadius(radius: 5, corners: self.shouldShowDropdown ? [.topLeft, .topRight] : .allCorners)
        .frame(height: self.buttonHeight)
        .overlay(
            !self.shouldShowDropdown ?
            AnyView(RoundedRectangle(cornerRadius: 5).stroke(Color(red: 49/255, green: 54/255, blue: 60/255).opacity(0.3), lineWidth: 1)) :
            AnyView(EmptyView())
        )
        .overlay(
            VStack(spacing: 0) {
                if self.shouldShowDropdown {
                    Spacer(minLength: buttonHeight)
                    Rectangle().fill(Color.gray.opacity(0.1)).frame(height: 1).animation(nil)
                    Dropdown(options: self.options, selected: $selected, onSelect: self.onSelect)
                }
            }, alignment: .topLeading
        )
        .background(Rectangle()
                        .fill(Color.white)
                        .cornerRadius(radius: 5, corners: self.shouldShowDropdown ? [.topLeft, .topRight] : .allCorners)
                        
                        .shadow(radius: self.shouldShowDropdown ? 4 : 0, x: self.shouldShowDropdown ? 2 : 0, y: self.shouldShowDropdown ? 2 : 0))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    struct CornerRadiusShape: Shape {

        var radius = CGFloat.infinity
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}
