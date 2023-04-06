//
//  PageModel.swift
//  Pinch
//
//  Created by Oleksii Vasyliev on 06.04.2023.
//

import Foundation

struct Page: Identifiable {
	let id: Int
	let imageName: String
}

extension Page {
	var thumbnailName: String {
		"thumb-" + imageName
	}
}
