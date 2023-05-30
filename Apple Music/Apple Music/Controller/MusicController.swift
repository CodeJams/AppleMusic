import UIKit
import AVFoundation
 
class MusicController: UIViewController, ObservableObject {
    var listaDeMusicas = ["musica1", "musica2", "musica3", "musica3"]
    var audioPlayer: AVAudioPlayer?
    var lastPlaybackTime: TimeInterval = 0
    // Metodo para controlar o tempo
	var currentTime: TimeInterval {
		audioPlayer?.currentTime ?? 0
	}
    
	var duration: TimeInterval {
        audioPlayer?.duration ?? 0
    }
    
    var isPlaying: Bool {
        audioPlayer?.isPlaying ?? false
    }
    
    @objc func playMusic(index: Int) {
        guard let url = Bundle.main.url(forResource: listaDeMusicas[index], withExtension: "mp3") else {
            print("Erro ao carregar o arquivo de música")
            return
        }
        
        do {
            if let player = audioPlayer, player.isPlaying {
                player.pause() // Pausar a música atual se estiver sendo reproduzida
            }
            
            if audioPlayer?.url == url {
                // Se a mesma música estiver sendo reproduzida novamente, retomar de onde parou
                audioPlayer?.currentTime = lastPlaybackTime
            } else {
                // Se for uma nova música, criar uma nova instância de AVAudioPlayer
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.delegate = self
            }
            
            audioPlayer?.play()
            print(listaDeMusicas[index])
            
        } catch {
            print("Erro ao reproduzir a música: \(error.localizedDescription)")
        }
    }
    
    @objc func pauseMusic() {
        if audioPlayer?.isPlaying == true {
            audioPlayer?.pause()
            lastPlaybackTime = audioPlayer?.currentTime ?? 0
        }
    }
    
    @objc func resumeMusic() {
        if let player = audioPlayer, !player.isPlaying {
            player.currentTime = lastPlaybackTime
            player.play()
        }
    }
}

extension MusicController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        // Lidar com o evento de reprodução concluída, se necessário.
    }
}

