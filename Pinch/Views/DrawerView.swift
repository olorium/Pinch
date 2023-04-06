//
//  DrawerView.swift
//  Pinch
//
//  Created by Oleksii Vasyliev on 06.04.2023.
//

import SwiftUI

struct DrawerView: View {
	@State private var isDrawerOpen = false
	/// Binding to define animation state.
	@Binding var isAnimating: Bool
	
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
			Spacer()
		}
		.padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
		.background(.ultraThinMaterial)
		.cornerRadius(12)
		.opacity(isAnimating ? 1 : 0)
		.frame(width: 260)
		.padding(.top, UIScreen.main.bounds.height / 12)
		.offset(x: isDrawerOpen ? 20 : 215)
    }
}

struct DrawerView_Previews: PreviewProvider {
    static var previews: some View {
		DrawerView(isAnimating: .constant(true))
    }
}
