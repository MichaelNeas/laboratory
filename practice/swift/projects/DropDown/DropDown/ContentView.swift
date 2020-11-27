//
//  ContentView.swift
//  DropDown
//
//  Created by Michael Neas on 10/26/20.
//

import SwiftUI

struct ContentView: View {
    @State var text = "Select Project"
    @State var open = false
    let options = [DropdownOption(key: "1", val: "First"), DropdownOption(key: "2", val: "Second"), DropdownOption(key: "3", val: "third"), DropdownOption(key: "4", val: "forth"),DropdownOption(key: "5", val: "fith"), DropdownOption(key: "6", val: "six"),DropdownOption(key: "7", val: "seven"), DropdownOption(key: "8", val: "eight")]
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                //Dropdown(options: options, selected: .constant("yo"), onSelect: { print($0)})
                VStack {
                    ScrollView {
                        ForEach(options, id: \.self) { option in
                            Text(option.val)
                                .foregroundColor(.black)
                                .padding(.vertical, 10)
                        }
                    }
                }.frame(height: 200)
                //.cornerRadius(radius: 5, corners: [.bottomLeft, .bottomRight])
                .background(Color.white)
                .shadow(radius: 4, x: 2, y: 5)
                Spacer()
                FilterSelection(options: options, onSelect: { print($0) })
                Spacer()
                DropdownButton(defaultTitle: text, shouldShowDropdown: false, displayText: $text, options: options, onSelect: { print($0) })
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            open.toggle()
                        }
                    }) {
                        Text("Open")
                    }
                    Spacer()
                }
                Spacer()
            }
            
            if open {
                Group {
                    BottomSheet(presented: $open)
                }.transition(.move(edge: .bottom))
                .animation(.spring())
            }
            
            
        }.background(Color.orange)
    }
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


struct BottomSheet: View {
    @GestureState private var offset: CGFloat = 0
    @Binding var presented: Bool
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .center) {
                HStack(alignment: .top) {
                    Spacer()
                    Capsule()
                        .fill(Color(red: 70/255, green: 69/255, blue: 69/255))
                        .frame(width: 100, height: 5)
                        .padding()
                    Spacer()
                }
                Spacer()
                Text("Private Content")
                Spacer()
            }.frame(height: proxy.size.height / 2.5)
            .background(Color.white)
            .cornerRadius(radius: 20, corners: [.topLeft, .topRight])
            .offset(y: proxy.frame(in: .global).height - (proxy.size.height / 3))
            .offset(y: offset)
            .gesture(DragGesture().updating(self.$offset) { value, state, _ in
                print(value.translation)
                // don't allow drag beyond max
                if value.translation.height > 0 {
                    state = value.translation.height
                }
            }.onEnded { value in
                if value.predictedEndTranslation.height > 160 {
                    presented = false
                }
            })
        }
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
                selected = selected == self.key ? "" : self.key
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
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}

struct Dropdown: View {
    var options: [DropdownOption]
    @Binding var selected: String
    var onSelect: ((_ key: String) -> Void)?

    var body: some View {
        VStack {
            ScrollView {
                ForEach(self.options, id: \.self) { option in
                    DropdownOptionElement(val: option.val, key: option.key, selected: $selected, onSelect: self.onSelect)
                }
            }//.frame(height: min(CGFloat(options.count) * 44.0, 200.0))
        }.frame(height: min(CGFloat(options.count) * 44.0, 200.0))
        .background(Rectangle().fill(Color.white))
        //.cornerRadius(radius: 5, corners: [.bottomLeft, .bottomRight])
        .shadow(radius: 4, x: 2, y: 5)
    }
}

struct DropdownButton: View {
    let defaultTitle: String
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
                if self.shouldShowDropdown == true {
                    displayText = defaultTitle
                } else {
                    if !selected.isEmpty, let val = options.first(where: { $0.key == selected })?.val {
                        displayText = val
                    } else {
                        displayText = defaultTitle
                    }
                }
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
            }.cornerRadius(radius: 5, corners: [.bottomLeft, .bottomRight]), alignment: .topLeading
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
