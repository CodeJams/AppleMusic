import Foundation
import SwiftUI

struct MusicCoverView: View {
    @Binding var index: Int
    @Binding var image: [String]
    @Binding var musicCoverSize: Int
    
    var body: some View {
                Image(image[index])
                    .resizable()
                    .frame(width: CGFloat(musicCoverSize), height: CGFloat(musicCoverSize))
                    .scaledToFill()
                    .clipped()
                    .cornerRadius(7.19)
                    .shadow(radius: 10)
                    .animation(.spring(dampingFraction: 0.4), value: musicCoverSize)
                    .padding(.top, 240)
                    //.padding(.horizontal, 60)
    }
}
