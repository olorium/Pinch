//
//  ControlPanelView.swift
//  Pinch
//
//  Created by Oleksii Vasyliev on 06.04.2023.
//

import SwiftUI

struct ControlPanelView: View {
	// MARK: - Properties
	/// Image scale property.
	@Binding var imageScale: CGFloat
	/// Offset for the image.
	@Binding var imageOffset: CGSize
	/// Binding to define animation state.
	@Binding var isAnimating: Bool
	/// Closure for resetting image state.
	let resetImageState: () -> Void
	
	// MARK: - Body.
    var body: some View {
		Group {
			HStack {
				Button {
					withAnimation(.spring()) {
						if imageScale > 1 {
							imageScale -= 1
						} else if imageScale <= 1 {
							resetImageState()
						}
					}
				} label: {
					ControlImageView(iconName: "minus.magnifyingglass")
				}
				Button {
					resetImageState()
				} label: {
					ControlImageView(iconName: "arrow.up.left.and.down.right.magnifyingglass")
				}
				Button {
					withAnimation(.spring()) {
						if imageScale < 5 {
							imageScale += 1
						} else if imageScale > 5 {
							imageScale = 5
						}
					}
				} label: {
					ControlImageView(iconName: "plus.magnifyingglass")
				}
			}
			.padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
			.background(.ultraThinMaterial)
			.cornerRadius(12)
			.opacity(isAnimating ? 1 : 0)
		}
    }
}
