//
//  ContentView.swift
//  Pinch
//
//  Created by Oleksii Vasyliev on 06.04.2023.
//

import SwiftUI

struct ContentView: View {
	// MARK: - Properties.
	/// Defines animation state.
	@State private var isAnimating = false
	/// Image scale property.
	@State private var imageScale: CGFloat = 1
	
	// MARK: - Body.
    var body: some View {
		NavigationView {
			ZStack {
				FrontCoverImageView(imageName: "magazine-front-cover", isAnimating: $isAnimating, imageScale: $imageScale)
			}
			.navigationTitle("Pinch and Zoom")
			.navigationBarTitleDisplayMode(.inline)
			.onAppear {
				isAnimating = true
			}
		}
		.navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
