//
//  ControlImageView.swift
//  Pinch
//
//  Created by Oleksii Vasyliev on 06.04.2023.
//

import SwiftUI

/// ImageView with icon.
struct ControlImageView: View {
	/// The name of the icon
	let iconName: String
	
    var body: some View {
		Image(systemName: iconName)
			.font(.system(size: 36))
    }
}

struct ControlImageView_Previews: PreviewProvider {
    static var previews: some View {
        ControlImageView(iconName: "minus.magnifyingglass")
			.preferredColorScheme(.dark)
			.previewLayout(.sizeThatFits)
			.padding()
    }
}
