//
//  ContentView.swift
//  ios-learn
//
//  Created by Swap-Dev on 4/1/24.
//

import SwiftUI

extension Image{
	func imageModifier()-> some View {
		
		self
		.resizable()
		.scaledToFit()
			
	}
	func iconModifier()->some View {
		self
			.imageModifier()
			.frame(maxWidth: 128)
	}
}

struct ContentView: View {
	private let imageUrl: String = "https://credo.academy/credo-academy@3x.png"
	
	var body: some View {
		Label("Digital Office", systemImage: "42.circle")
		VStack {
			Image(systemName: "photo.circle.fill")
				.resizable()
				.scaledToFit()
				.frame(maxWidth: 56)
				.foregroundColor(.purple)
				.opacity(0.8)
			
			// Async image
			AsyncImage(url: URL(string: imageUrl)) { phase in
				if let image = phase.image {
					image
						.imageModifier() // Use your custom modifier
				} else if phase.error != nil {
					Image(systemName: "ant.circle.fill")
						.iconModifier() // Use your custom modifier
				} else {
					Image(systemName: "photo.circle.fill")
						.iconModifier() // Use your custom modifier
				}
			}
			.padding(40)

			Image("Hireexpert")
				.resizable()
				.scaledToFit()
			
			Image(systemName: "globe")
				.imageScale(.large)
				.foregroundStyle(.tint)
			Text("Global HR Mangement")
		}
		.padding()
	}
}


#Preview {
    ContentView()
}
