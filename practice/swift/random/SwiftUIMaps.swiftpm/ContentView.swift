import SwiftUI
import MapKit

@available(iOS 17.0, *)
struct ContentView: View {
    @State
    private var cameraPosition: MapCameraPosition = .camera(.init(centerCoordinate: .init(latitude: 37.333273, longitude: -122.006581), distance: 500, heading: 270, pitch: 65))
    
    var body: some View {
        Map(position: $cameraPosition) {
            Annotation("Visitor Center", coordinate: .init(latitude: 37.332835, longitude: -122.005354), anchor: .bottom, content: {
                ZStack {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 40, height: 40)
                    Image(systemName: "mappin.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28, height: 28)
                        .foregroundColor(.white)
                }
            })
            
            MapPolygon(coordinates: [.init(latitude: 37.333994, longitude: -122.005044),
                                     .init(latitude: 37.333994, longitude: -122.004816),
                                     .init(latitude: 37.332484, longitude: -122.004816),
                                     .init(latitude: 37.332484, longitude: -122.005044)])
            .foregroundStyle(.fill)
            
        }
            .frame(width: 800, height: 800)
            .mapStyle(.standard(elevation: .realistic))
    }
}
