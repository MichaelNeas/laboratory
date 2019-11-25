//
//  CustomText.swift
//  Moonshot
//
//  Created by Michael Neas on 11/24/19.
//  Copyright © 2019 Neas Lease. All rights reserved.
//

import SwiftUI

struct CustomTexts: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        self.text = text
    }
}

struct CustomText: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                ForEach(0..<100){
                    CustomTexts("\($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct CustomText_Previews: PreviewProvider {
    static var previews: some View {
        CustomText()
    }
}
