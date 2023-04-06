//
//  FrontCoverImageView.swift
//  Pinch
//
//  Created by Oleksii Vasyliev on 06.04.2023.
//

import SwiftUI

/// View with scalable image
struct FrontCoverImageView: View {
	// MARK: - Properties
	/// Image scale property.
	@State private var imageScale: CGFloat = 1
	/// Offset for the image.
	@State private var imageOffset: CGSize = .zero
	/// Binding to define animation state.
	@Binding var isAnimating: Bool
	///Image name to present.
	let imageName: String
	
	// MARK: - Body.
	var body: some View {
		Image(imageName)
			.resizable()
			.aspectRatio(contentMode: .fit)
			.cornerRadius(10)
			.padding()
			.shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
			.opacity(isAnimating ? 1 : 0)
			.offset(x: imageOffset.width, y: imageOffset.height)
			.animation(.linear(duration: 1), value: isAnimating)
			.scaleEffect(imageScale)
			.onTapGesture(count: 2) {
				if imageScale == 1 {
					withAnimation(.spring()) {
						imageScale = 5
					}
				} else {
					resetImageState()
				}
			}
			.gesture(DragGesture()
				.onChanged { value in
					withAnimation(.linear(duration: 1)) {
						imageOffset = value.translation
					}
				}
				.onEnded { _ in
					if imageScale <= 1 {
						withAnimation(.spring()) {
							resetImageState()
						}
					}
				}
			)
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

struct FrontCoverImageView_Previews: PreviewProvider {
    static var previews: some View {
		FrontCoverImageView(isAnimating: .constant(true), imageName: "magazine-front-cover")
    }
}
