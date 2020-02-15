//
//  EmojiRatings.swift
//  Bookworm
//
//  Created by Michael Neas on 2/14/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//

import SwiftUI

struct EmojiRatings: View {
    let rating: Int16
    
    var body: some View {
        switch rating {
        case 1:
            return Text("💩")
        case 2:
            return Text("🙀")
        case 3:
            return Text("🏄🏽‍♀️")
            case 4:
            return Text("👍")
        default:
            return Text("🎉")
        }
    }
}

struct EmojiRatings_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatings(rating: 3)
    }
}
