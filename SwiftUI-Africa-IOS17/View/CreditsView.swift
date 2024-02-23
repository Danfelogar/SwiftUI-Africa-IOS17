//
//  CreditsView.swift
//  SwiftUI-Africa-IOS17
//
//  Created by Daniel Felipe on 18/02/24.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)

            Text("""
                Copyright © Danfelogar All right reserved Better App Less Code
            """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        } // VStack
        .padding()
        .opacity(0.4)
    }
}

#Preview { CreditsView() }
