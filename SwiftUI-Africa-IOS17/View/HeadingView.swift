//
//  HeadingView.swift
//  SwiftUI-Africa-IOS17
//
//  Created by Daniel Felipe on 18/02/24.
//

import SwiftUI

struct HeadingView: View {
    //MARK: - Properties
    var headingImage: String
    var headingText: String
    //MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

struct HeadingView_Previews: PreviewProvider {
    
    static let animals: [Animal] =  Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            HeadingView(headingImage: "photo.on.rectangle.angled", headingText:"Wilderness in Pictures")
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
