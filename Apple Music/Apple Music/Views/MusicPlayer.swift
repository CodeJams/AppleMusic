import SwiftUI
import UIKit

struct MusicPlayer: View {
    
    @State var image = ["imagem1", "imagem2", "imagem3", "imagem4"]
    @State private var backgroundColor: UIColor = .clear
    @State var isPaused = true
    @State var index = 0
	@StateObject var musicController = MusicController()
    @State var musicCoverSize = 252
    
    @State private var color: Color = .white
    private var normalFillColor: Color { color.opacity(0.5) }
    private var emptyColor: Color { color.opacity(0.3) }

    var body: some View {
      //para resolver o problema usar geomnetry READER PARA ESCOLHER A POSIÇAO FIXA DO ITEM

        ZStack {
            //background
            Backgroud(index: $index, backgroundColor: $backgroundColor, image: $image)

            GeometryReader { geometry in
                VStack {
                    //imagem da musica
                    VStack(alignment: .center) {
                        Spacer()
                        MusicCoverView(index: $index, image: $image, musicCoverSize: $musicCoverSize)
                            .offset(y:-100)
                        Spacer()
                    }.frame(width: geometry.size.width,
                            height: geometry.size.height * 0.65)
                    VStack {
                        HStack{
                            //nome da musica
                            NameMusicView(index: $index).foregroundColor(.white)
                                .offset(y:-125)
                            
                            Spacer()
                            //pull down menu
                            PullDownMenu()
                                .offset(x:10, y:-125)
                            
                        }
                        .padding(.horizontal, 35)
                        
                        MusicProgressSlider(value: $musicController.currentTime, inRange: TimeInterval.zero...200, activeFillColor: color, fillColor: normalFillColor, emptyColor: emptyColor, height: 26) { started in
                            musicController.setCurrentTime()
                        }
                        .padding(.horizontal, 35)
                        .offset(y:-110)
                        
                        //Botões para tocar e passar a musica
                        HStack(spacing: 76){
                            Button (action: {
                                if index != 0{
                                    index -= 1;
                                    setAverageColor()
                                }
                                if isPaused == false{
                                    musicController.playMusic(index: index)
                                }
                                else {
                                    musicController.pauseMusic()
                                }
                            }){
                                Image(systemName: "backward.fill")
                                    .resizable()
                                    .frame(width: 38, height: 24, alignment: .center)
                                    .foregroundColor(Color.white)
                                
                            }
                            if(isPaused == true){
                                Button (action: {musicController.playMusic(index: index); isPaused = false;                             musicCoverSize = 340
                                }){
                                    Image(systemName: "play.fill")
                                        .resizable()
                                        .frame(width: 35, height: 40, alignment: .center)
                                        .foregroundColor(Color.white)
                                    
                                    
                                }
                            }else{
                                Button (action: {musicController.pauseMusic(); isPaused = true;                             musicCoverSize = 252}){
                                    Image(systemName: "pause.fill")
                                        .resizable()
                                        .frame(width: 35, height: 40, alignment: .center)
                                        .foregroundColor(Color.white)
                                    
                                }
                            }
                            Button (action: {
                                if index == 3{
                                    index = 0
                                }else{
                                    index += 1;
                                }
                                setAverageColor()
                                if isPaused == false{
                                    musicController.playMusic(index: index)
                                }
                                else {
                                    musicController.pauseMusic()
                                }
                            }){
                                Image(systemName: "forward.fill")
                                    .resizable()
                                    .frame(width: 38, height: 24, alignment: .center)
                                    .foregroundColor(Color.white)
                                
                            }
                        }
                        .offset(y:-75)
                        
                        VolumeSlider(value: $musicController.volume, inRange: 0...1, activeFillColor: color, fillColor: normalFillColor, emptyColor: emptyColor, height: 8) { started in
                            musicController.setVolume()
                        }
                        .onAppear{
                            musicController.setVolume()
                        }
                        .padding(.horizontal, 35)
                        .offset(y:-25)
                        
                        BottomButtons()
                            .foregroundColor(Color.white)
                            .padding(.horizontal, 70)
                            .opacity(0.7)
                        
                    }.frame(width: geometry.size.width , height: geometry.size.height * 0.5)

                    
                }
                
                .edgesIgnoringSafeArea(.all)
                .onAppear {self.setAverageColor()}
            }
        }
    }
    
    
    //Devolve a cor média
    func setAverageColor() {
        @State var uiColor = UIImage(named: image[index])?.averageColor
        print(image[index])
        backgroundColor = uiColor ?? .clear
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayer()
    }
}

