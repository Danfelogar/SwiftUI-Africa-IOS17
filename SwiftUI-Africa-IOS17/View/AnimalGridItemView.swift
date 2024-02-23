//
//  AnimalGridItemView.swift
//  SwiftUI-Africa-IOS17
//
//  Created by Daniel Felipe on 18/02/24.
//

import SwiftUI

struct AnimalGridItemView: View {
    //MARK: - Properties
    let animal: Animal
    //MARK: - Body
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    
    static let animals: [Animal] =  Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalGridItemView(animal: animals[3])
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
