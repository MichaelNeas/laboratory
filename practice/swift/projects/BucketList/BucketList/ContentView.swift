//
//  ContentView.swift
//  BucketList
//
//  Created by Michael Neas on 2/17/20.
//  Copyright © 2020 Neas Lease. All rights reserved.
//

import LocalAuthentication
import SwiftUI
import MapKit

struct ContentView: View {
    @State private var isUnlocked = false
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [CodableMKPointAnnotation]()
    @State private var selectedPlace: MKPointAnnotation?
    @State private var showingDetails = false
    @State private var showingEditScreen = false
    
    var body: some View {
        ZStack {
            if isUnlocked {
                MapView(centerCoordinate: $centerCoordinate,
                        selectedPlace: $selectedPlace,
                        showingPlaceDetails: $showingDetails,
                        annotations: locations)
                    .edgesIgnoringSafeArea(.all)
                Circle()
                    .fill(Color.blue)
                    .opacity(0.3)
                    .frame(width: 32, height: 32)
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            let newLocation = CodableMKPointAnnotation()
                            newLocation.coordinate = self.centerCoordinate
                            newLocation.title = "example"
                            self.locations.append(newLocation)
                            self.selectedPlace = newLocation
                            self.showingEditScreen = true
                        }) {
                            Image(systemName: "plus")
                        }
                        .padding()
                        .background(Color.black.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding()
                    }
                }
                .alert(isPresented: $showingDetails) {
                    Alert(title: Text(selectedPlace?.title ?? "Unknown"),
                          message: Text(selectedPlace?.subtitle ?? "No place info"),
                          primaryButton: .default(Text("OK")),
                          secondaryButton: .default(Text("Edit")) {
                            self.showingEditScreen = true
                        })
                }
                .sheet(isPresented: $showingEditScreen, onDismiss: saveData) {
                    if self.selectedPlace != nil {
                        EditView(placemark: self.selectedPlace!)
                    }
                }
                .onAppear(perform: loadData)
            } else {
                Button("Unlock") {
                    self.authenticate()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Gotta have it"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        
                    }
                }
            }
        } else {
            // no bio
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadData() {
        let file = self.getDocumentsDirectory().appendingPathComponent("SavedPlaces")
        do {
            let data = try Data(contentsOf: file)
            locations = try JSONDecoder().decode([CodableMKPointAnnotation].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func saveData() {
        do {
            let file = self.getDocumentsDirectory().appendingPathComponent("SavedPlaces")
            let data = try JSONEncoder().encode(self.locations)
            // complete file protection for encryption
            // atomic in case for multiple writes to same place
            try data.write(to: file, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
