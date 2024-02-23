//
//  InsetGalleryView.swift
//  SwiftUI-Africa-IOS17
//
//  Created by Daniel Felipe on 18/02/24.
//

import SwiftUI

struct InsetGalleryView: View {
    //MARK: - Properties
    let animal: Animal
    //MARK: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            }
        }
    }
}

    struct InsetGalleryView_Previews: PreviewProvider {
        
        static let animals: [Animal] =  Bundle.main.decode("animals.json")
        
        static var previews: some View {
            NavigationView {
                InsetGalleryView(animal: animals[3])
            }
        }
    }
