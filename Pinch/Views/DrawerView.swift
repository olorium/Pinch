//
//  DrawerView.swift
//  Pinch
//
//  Created by Oleksii Vasyliev on 06.04.2023.
//

import SwiftUI

struct DrawerView: View {
	/// Defines if drawer is expanded.
	@State private var isDrawerOpen = false
	/// Binding to define animation state.
	@Binding var isAnimating: Bool
	/// Used to choose and present images.
	@Binding var pageIndex: Int
	///Image name to present.
	let pages: [Page]
	
	// MARK: - Body.
    var body: some View {
		HStack(spacing: 12) {
			Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
				.resizable()
				.scaledToFit()
				.frame(height: 40)
				.padding(8)
				.foregroundStyle(.secondary)
				.onTapGesture {
					withAnimation(.easeOut) {
						isDrawerOpen.toggle()
					}
				}
			ForEach(pages) { item in
				Image(item.thumbnailName)
					.resizable()
					.scaledToFit()
					.frame(width: 80)
					.cornerRadius(8)
					.shadow(radius: 4)
					.opacity(isDrawerOpen ? 1 : 0)
					.animation(.easeOut(duration: 0.5), value: isDrawerOpen)
					.onTapGesture {
						isAnimating = true
						pageIndex = item.id
					}
			}
			Spacer()
		}
		.padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
		.background(.ultraThinMaterial)
		.cornerRadius(12)
		.frame(width: 260)
		.padding(.top, UIScreen.main.bounds.height / 12)
		.offset(x: isDrawerOpen ? 20 : 215)
    }
}

struct DrawerView_Previews: PreviewProvider {
    static var previews: some View {
		DrawerView(isAnimating: .constant(true), pageIndex: .constant(1), pages: PageData.pages)
    }
}
