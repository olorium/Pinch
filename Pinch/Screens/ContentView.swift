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
	/// Offset for the image.
	@State private var imageOffset: CGSize = .zero
	
	// MARK: - Body.
    var body: some View {
		NavigationView {
			ZStack {
				Color.clear
				
				FrontCoverImageView(
					imageScale: $imageScale,
					imageOffset: $imageOffset,
					isAnimating: $isAnimating,
					imageName: "magazine-front-cover") {
						resetImageState()
					}
			}
			.navigationTitle("Pinch and Zoom")
			.navigationBarTitleDisplayMode(.inline)
			.onAppear {
				isAnimating = true
			}
			.overlay(alignment: .top) {
				InfoPanelView(scale: imageScale, offset: imageOffset)
					.padding(.horizontal)
					.padding(.top, 30)
			}
			.overlay(alignment: .bottom) {
				ControlPanelView(
					imageScale: $imageScale,
					imageOffset: $imageOffset,
					isAnimating: $isAnimating,
					resetImageState: {
						resetImageState()
					})
				.padding(.bottom, 30)
			}
			.overlay(alignment: .topTrailing) {
				DrawerView(isAnimating: $isAnimating)
			}
		}
		.navigationViewStyle(.stack)
    }
	
	// MARK: - Methods
	
	/// Resets image scale and offset to default values with animation.
	private func resetImageState() {
		withAnimation(.spring()) {
			imageScale = 1
			imageOffset = .zero
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
