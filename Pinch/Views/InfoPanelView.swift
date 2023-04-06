//
//  InfoPanelView.swift
//  Pinch
//
//  Created by Oleksii Vasyliev on 06.04.2023.
//

import SwiftUI

struct InfoPanelView: View {
	/// Sets up the visibility of the view
	@State private var isInfoPanelVisible: Bool = false
	/// Scale of the image to show.
	var scale: CGFloat
	/// Offset of the image to show.
	var offset: CGSize
	
	// MARK: - Body.
    var body: some View {
		HStack {
			Image(systemName: "circle.circle")
				.symbolRenderingMode(.hierarchical)
				.resizable()
				.frame(width: 30, height: 30)
				.onLongPressGesture(minimumDuration: 1) {
					withAnimation(.easeOut) {
						isInfoPanelVisible.toggle()
					}
				}
			Spacer()
			
			HStack(spacing: 2) {
				Image(systemName: "arrow.up.left.and.arrow.down.right")
				Text("\(scale)")
				
				Spacer()
				
				Image(systemName: "arrow.left.and.right")
				Text("\(offset.width)")
				
				Spacer()
				
				Image(systemName: "arrow.up.and.down")
				Text("\(offset.height)")
				
				Spacer()
			}
			.font(.footnote)
			.padding(8)
			.background(.ultraThinMaterial)
			.cornerRadius(8)
			.frame(maxWidth: 420)
			.opacity(isInfoPanelVisible ? 1 : 0)
			
			Spacer()
		}
    }
}

struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
		InfoPanelView(scale: 1, offset: .zero)
			.preferredColorScheme(.dark)
			.previewLayout(.sizeThatFits)
			.padding()
    }
}
