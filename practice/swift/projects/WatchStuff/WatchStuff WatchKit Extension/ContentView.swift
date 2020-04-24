//
//  ContentView.swift
//  WatchStuff WatchKit Extension
//
//  Created by Michael Neas on 4/24/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CardView(card: Card.test, removal: nil)
    }
}

struct CardView: View {
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    @State private var showDocumentation = false
    
    @ObservedObject var card: Card
    var removal: (() -> Void)?

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(
                        Color.gray
                            .opacity(1 - Double(abs(self.offset.width / 500)) - Double(abs(self.offset.height / 500)))
                    )
                    .background(
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                            .fill(Color.blue)
                    )
                    .shadow(radius: 10)
                VStack {
                    Text(self.card.question)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .lineLimit(nil)
                        .allowsTightening(true)
                        .minimumScaleFactor(0.7)

                    if self.isShowingAnswer {
                        Spacer()
                        Text(self.card.answer)
                            .font(.title)
                            .foregroundColor(.secondary)
                            .lineLimit(nil)
                            .allowsTightening(true)
                            .minimumScaleFactor(0.9)
                            .transition(.opacity)
                        Spacer()
                        Text(self.card.sdkDescription)
                            .font(.headline)
                            .foregroundColor(.secondary)
                            .lineLimit(2)
                            .allowsTightening(true)
                            .minimumScaleFactor(0.75)
                        Spacer(minLength: 30.0)
                    }
                }
                .padding(20)
                .multilineTextAlignment(.center)
            }
            //.frame(width: max(geometry.size.width - 500, 350), height: max(geometry.size.height/2, 250))
            .rotationEffect(.degrees(Double(self.offset.width / 10)))
            .animation(.spring())
            .offset(self.offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        self.offset = gesture.translation
                    }
                    .onEnded { gesture in
                        if (abs(self.offset.width) > 150 ||
                            abs(self.offset.height) > 150) ||
                            abs(gesture.predictedEndTranslation.width) > 200 ||
                            abs(gesture.predictedEndTranslation.height) > 200,
                            self.removal != nil {
                            self.removal?()
                        } else {
                            self.offset = .zero
                        }
                    }
            )
            .onTapGesture {
                self.isShowingAnswer.toggle()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
