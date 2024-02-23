//
//  MapView.swift
//  SwiftUI-Africa-IOS17
//
//  Created by Daniel Felipe on 18/02/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - Properties
    @State private var region: MapCameraPosition = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return MapCameraPosition.region(mapRegion)
    }()
    
    @State private var selection: String?
    @State private var latitude: String = "6.600286"
    @State private var longitude: String = "16.437759"
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    //MARK: - Body
    var body: some View {
        //1. Basic Map
        //Map(coordinateRegion: $region)
        //2. Advanced Map
        Map(position: $region, selection: $selection){
            ForEach(locations) { location in
                //1. Pin: Old Style (always static)
                //MapPin(coordinate: location.location, tint: .accentColor)
                //2. Marker: New Style (always static)
                //Marker(coordinate: location.location, tint: .accentColor)
//                Marker(coordinate: location.location) {
//                        // Additional content for the marker if needed
//                    }
                //3. Custom basic annotation(it could be interactive)
//                Annotation(location.name, coordinate: location.location) {
//                    Image("logo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 32, height: 32, alignment: .center)
//                }//: Annotation
                //4. Custom advance annotation (it could be interactive)
                Annotation(location.name, coordinate: location.location) {
                    MapAnnotationView(location: location)
                    
                }//: Annotation
            }//:Loop
        }//: Map
        .overlay(
            HStack(alignment: .center, spacing:12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height:  48, alignment:  .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(latitude)")
                            .font(.footnote)
                            .foregroundStyle(.white)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(longitude)")
                            .font(.footnote)
                            .foregroundStyle(.white)
                    }
                }//: VStack
            }//:HStack
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                )
                .padding()
            , alignment: .top
        )
    }
}

#Preview { MapView() }
