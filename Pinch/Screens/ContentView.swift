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
	
	// MARK: - Body.
    var body: some View {
		NavigationView {
			ZStack {
				FrontCoverImageView(
					isAnimating: $isAnimating,
					imageName: "magazine-front-cover"
				)
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
