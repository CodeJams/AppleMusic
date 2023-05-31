import SwiftUI
import UIKit

struct MusicPlayer: View {
    
    @State var image = ["imagem1", "imagem2", "imagem3", "imagem4"]
    @State private var backgroundColor: UIColor = .clear
    @State var isPaused = true
    @State var index = 0
    @State var musicCoverSize = 252
	@StateObject var controller: MusicController

    var body: some View {
        ZStack {
            //background
            Backgroud(index: $index, backgroundColor: $backgroundColor, image: $image)
            
            VStack {
                //imagem da musica
                MusicCoverView(index: $index, image: $image, musicCoverSize: $musicCoverSize)
                
                //nome da musica
                NameMusicView(index: $index).foregroundColor(.white)
                
                //Botões para tocar e passar a musica
                HStack(spacing: 76){
                    Button (action: {
                        if index != 0{
                            index -= 1;
                            setAverageColor()
                        }
                        if isPaused == false{
                            controller.playMusic(index: index)
                        }
                        else {
                            controller.pauseMusic()
                        }
                    }){
                        Image(systemName: "backward.fill")
                            .resizable()
                            .frame(width: 53, height: 40, alignment: .center)
                            .foregroundColor(Color.white)

                    }
                    if(isPaused == true){
                        Button (action: {controller.playMusic(index: index); isPaused = false;                             musicCoverSize = 362
}){
                            Image(systemName: "play.fill")
                                .resizable()
                                .frame(width: 35, height: 45, alignment: .center)
                                .foregroundColor(Color.white)
                            

                        }
                    }else{
                        Button (action: {controller.pauseMusic(); isPaused = true;                             musicCoverSize = 252}){
                            Image(systemName: "pause.fill")
                                .resizable()
                                .frame(width: 35, height: 45, alignment: .center)
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
                            controller.playMusic(index: index)
                        }
                        else {
                            controller.pauseMusic()
                        }
                    }){
                        Image(systemName: "forward.fill")
                            .resizable()
                            .frame(width: 53, height: 40, alignment: .center)
                            .foregroundColor(Color.white)

                    }
                }
                
				var tempo = controller.currentTime
//
                //Botões da parte inferior da tela
                BottomButtons()
                    .foregroundColor(Color.white)
                
            }.padding()
            
        }.padding()
        .edgesIgnoringSafeArea(.all)
        .onAppear {self.setAverageColor()}

    } 
    
    //Devolve a cor média
    func setAverageColor() {
        @State var uiColor = UIImage(named: image[index])?.averageColor
        print(image[index])
        backgroundColor = uiColor ?? .clear
    }
}

//struct ContentView_Previews: PreviewProvider {
//	@ObservedObject var controller: MusicController
//    static var previews: some View {
//		MusicPlayer(controller: controller)
//    }
//}
//
