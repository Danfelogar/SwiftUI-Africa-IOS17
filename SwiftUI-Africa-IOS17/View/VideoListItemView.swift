//
//  VideoListItem.swift
//  SwiftUI-Africa-IOS17
//
//  Created by Daniel Felipe on 18/02/24.
//

import SwiftUI

struct VideoListItemView: View {
    //MARK: - Properties
    let video: Video
    //MARK: - Body
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .cornerRadius(4)
            }//: ZStack
            
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }//: VStack
        }//: ZStack
    }
}

struct VideoListItem_Previews: PreviewProvider {
    
    static let videos: [Video] =  Bundle.main.decode("videos.json")
    
    static var previews: some View {
        NavigationView {
            VideoListItemView(video: videos[3])
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
