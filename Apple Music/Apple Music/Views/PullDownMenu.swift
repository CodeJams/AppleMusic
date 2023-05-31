import SwiftUI

struct PullDownMenu: View {
    var body: some View {
        VStack{
            Menu{
                Section{
                    Button(action: {}) {
                        Label("Suggest Less", systemImage: "hand.thumbsdown")
                    }
                    Button(action: {}) {
                        Label("Love", systemImage: "heart")
                    }
                }
                Section{
                    Button(action: {}) {
                        Label("Create Station", systemImage: "badge.plus.radiowaves.right")
                    }
                    Button(action: {}) {
                        Label("Show Album", systemImage: "heart")
                    }
                    Button(action: {}) {
                        Label("Share Lyrics...", systemImage: "heart")
                    }
                    Button(action: {}) {
                        Label("View Full Lyrics", systemImage: "heart")
                    }
                    Button(action: {}) {
                        Label("SharePlay", systemImage: "shareplay")
                    }
                    Button(action: {}) {
                        Label("Share Song...", systemImage: "square.and.arrow.up")
                    }
                    
                }
                Section{
                    Button(action: {}) {
                        Label("Add a Playlist...", systemImage: "text.badge.plus")
                    }
                    
                    Button(action: {}) {
                        Label("Add to Library", systemImage: "plus")
                    }
                }
            } label: {
                Label("", systemImage: "ellipsis.circle.fill")
                    .font(.system(size: 28))
                    .foregroundColor(.white)
                    .opacity(0.9)
                    .symbolRenderingMode(.hierarchical)
            }
        }
    }
}

struct PullDownMenu_Previews: PreviewProvider {
    static var previews: some View {
        PullDownMenu()
    }
}

