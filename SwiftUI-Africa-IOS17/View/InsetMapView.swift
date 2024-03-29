//
//  InsetMapView.swift
//  SwiftUI-Africa-IOS17
//
//  Created by Daniel Felipe on 18/02/24.
//
import MapKit
import SwiftUI

struct InsetMapView: View {
    //MARK: - Properties
    @State private var cameraPosition = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), // initial location
        span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0) // initial zoom
    ))
    //MARK: - Body
    var body: some View {
        Map(position: $cameraPosition)
            .overlay(
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundColor(Color.white)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }//: HStack
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    )
                }//: Navigation
                    .padding(12)
                ,alignment: .topTrailing
            )
            .frame(height: 256)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct InsetMapView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            InsetMapView()
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
