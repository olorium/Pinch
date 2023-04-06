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
	///Image name to present.
	let imageName: String
	/// Binding to define animation state.
	@Binding var isAnimating: Bool
	/// Binding for the image scale.
	@Binding var imageScale: CGFloat
	
	// MARK: - Body.
	var body: some View {
		Image(imageName)
			.resizable()
			.aspectRatio(contentMode: .fit)
			.cornerRadius(10)
			.padding()
			.shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
			.opacity(isAnimating ? 1 : 0)
			.animation(.linear(duration: 1), value: isAnimating)
			.scaleEffect(imageScale)
			.onTapGesture(count: 2) {
				if imageScale == 1 {
					withAnimation(.spring()) {
						imageScale = 5
					}
				} else {
					withAnimation(.spring()) {
						imageScale = 1
					}
				}
			}
	}
}

struct FrontCoverImageView_Previews: PreviewProvider {
    static var previews: some View {
		FrontCoverImageView(imageName: "magazine-front-cover", isAnimating: .constant(true), imageScale: .constant(1))
    }
}
