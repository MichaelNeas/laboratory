//
//  RudamentaryAnimations.swift
//  AnimationsSwiftUI
//
//  Created by Michael Neas on 11/24/19.
//  Copyright © 2019 Neas Lease. All rights reserved.
//

import SwiftUI

struct RudamentaryAnimations: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Button("Tap Me") {
            //self.animationAmount += 1
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(Double(2-animationAmount))
                .animation(
                       Animation
                           .easeInOut(duration: 0.5)
                           .delay(1)
                           //.repeatCount(5, autoreverses: true)
                           .repeatForever(autoreverses: true)
                   )
                   //.animation(.interpolatingSpring(stiffness: 50, damping: 1))
        )
        .scaleEffect(animationAmount)
        //.blur(radius: (animationAmount - 1) * 3)
        .onAppear {
            self.animationAmount = 2
        }
       
    }
}

// spin
//Button("Tap Me") {
//    withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
//        self.animationAmount += 360
//    }
//}
//.padding(50)
//.background(Color.red)
//.foregroundColor(.white)
//.clipShape(Circle())
//.rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))

//return VStack {
//    Stepper("Scale amount", value: $animationAmount.animation(
//        Animation.easeInOut(duration: 1)
//            .repeatCount(3, autoreverses: true)
//    ), in: 1...10)
//    Spacer()
//    Button("Tap Me") {
//        self.animationAmount += 1
//    }
//    .padding(40)
//    .background(Color.red)
//    .foregroundColor(.white)
//    .clipShape(Circle())
//    .scaleEffect(animationAmount)
//}

// Ordering matters
//Button("Tap Me") {
//    self.enabled.toggle()
//}
//.frame(width: 200, height: 200)
//.background(enabled ? Color.blue : Color.purple)
//.animation(nil)
//.foregroundColor(.white)
//.clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
//.animation(.interpolatingSpring(stiffness: 10, damping: 1))


// Card drag
//LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
//.frame(width: 300, height: 200)
//.clipShape(RoundedRectangle(cornerRadius: 10))
//.offset(dragAmount)
//.gesture(
//    DragGesture()
//        .onChanged { self.dragAmount = $0.translation }
//        .onEnded { _ in
//            withAnimation(.spring()) {
//                self.dragAmount = .zero
//            }
//        }
//)
//.animation(.spring())

// Drag letters
//@State private var dragAmount = CGSize.zero
//@State private var enabled = false
//let letters = Array("Hello SwiftUI")
//HStack(spacing: 0) {
//    ForEach(0..<letters.count) { num in
//        Text(String(self.letters[num]))
//            .padding(5)
//            .font(.title)
//            .background(self.enabled ? Color.blue : Color.red)
//            .offset(self.dragAmount)
//            .animation(Animation.default.delay(Double(num) / 20))
//    }
//}
//.gesture(
//    DragGesture()
//        .onChanged { self.dragAmount = $0.translation }
//        .onEnded { _ in
//            self.dragAmount = .zero
//            self.enabled.toggle()
//        }
//)

// transitions
// @State private var isShowingRed = false
//VStack {
//    Button("Tap Me") {
//        withAnimation {
//            self.isShowingRed.toggle()
//        }
//    }
//    if isShowingRed {
//        Rectangle()
//        .fill(Color.red)
//        .frame(width: 200, height: 200)
//            .transition(.asymmetric(insertion: .scale, removal: .opacity))
//    }
//}
