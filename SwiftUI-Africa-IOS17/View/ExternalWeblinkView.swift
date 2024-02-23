//
//  ExternalWeblinkView.swift
//  SwiftUI-Africa-IOS17
//
//  Created by Daniel Felipe on 18/02/24.
//

import SwiftUI

struct ExternalWeblinkView: View {
    //MARK: - Properties
    let animal: Animal
    //MARK: - Body
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("wikipedia")
                
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }//: Group
                .foregroundColor(.accentColor)
            }//: HStack
        }//: Group box
    }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
    
    static let animals: [Animal] =  Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            ExternalWeblinkView(animal: animals[3])
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
