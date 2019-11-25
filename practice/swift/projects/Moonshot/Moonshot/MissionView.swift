//
//  MissionView.swift
//  Moonshot
//
//  Created by Michael Neas on 11/24/19.
//  Copyright © 2019 Neas Lease. All rights reserved.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let astronauts: [CrewMember]
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                VStack {
                    Image(self.mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geo.size.width * 0.7)
                        .padding(.top)
                    
                    Text(self.mission.description)
                        .padding()
                    
                    ForEach(self.astronauts, id: \.role) { member in
                        NavigationLink(destination: AstronautView(astronaut: member.astronaut)) {
                            HStack {
                                Image(member.astronaut.id)
                                .resizable()
                                .frame(width: 83, height: 60)
                                .clipShape(Capsule())
                                .overlay(Capsule()
                                    .stroke(Color.primary, lineWidth: 1)
                                )
                                
                                VStack(alignment: .leading) {
                                    Text(member.astronaut.name)
                                        .font(.headline)
                                    Text(member.role)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    
                    // if stack orientation changes spacer will adjust
                    Spacer(minLength: 25)
                }
            }
        }
    }
    
    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission
        var matches = [CrewMember]()
        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id == member.name }) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Mission \(member)")
            }
        }
        self.astronauts = matches
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
    }
}
