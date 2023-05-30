//
//  ProgressBar.swift
//  Apple Music
//
//  Created by João Paranhos on 24/05/23.
//

import SwiftUI
import AVFoundation

struct ProgressBar: View {
	@EnvironmentObject var controller: MusicController
	
	var body: some View {
		//		Slider(value: controller.currentTime, in:0...100, step:1){
		//			Text("Speed")
		//				} minimumValueLabel: {
		//					Text("\(controller.currentTime)")
		//				} maximumValueLabel: {
		//					Text("\(controller.duration)")
		//				}
		
		ZStack(alignment: .leading) {
			// Barra do fundo
			Capsule()
				.frame(height: 8)
				.foregroundColor(.gray)
			
			// Barra que indica o progresso
			GeometryReader { geometry in
				Capsule()
					.frame(width: progressBarWidth(geometry: geometry), height: 8)
					.foregroundColor(.white)
					.animation(.linear)
//									.gesture(DragGesture(minimumDistance: 0)
//										.onChanged({ value in
//											updateProgress(value: value.location.x, geometry: geometry)
//										})
			}
		}
	}
	
	private func progressBarWidth(geometry: GeometryProxy) -> CGFloat {
		let progress = CGFloat(controller.currentTime / controller.duration)
		//		print(currentTime)
		//		print(progress)
		//		guard progress.isFinite, !progress.isNaN, progress >= 0 else {
		//			return 0
		//		}
		
		return progress * geometry.size.width
	}
	
	
	//	private func updateProgress(value: CGFloat, geometry: GeometryProxy) {
	//		let progress = value / geometry.size.width
	//		let newTime = TimeInterval(progress) * controller.duration
	//		controller.currentTime = newTime
	//
	//	}
	//}
	//
	//struct ProgressBar_Previews: PreviewProvider {
	//	static var previews: some View {
	//		ProgressBar(controller.currentTime: .constant(0), controller.duration: 100)
	//	}
	//}
}
