import SwiftUI
import UIKit
import AVFoundation


class MusicController: NSObject, ObservableObject {
    
    var listaDeMusicas = ["musica1", "musica2", "musica3", "musica3"]
    var audioPlayer: AVAudioPlayer?
    var lastPlaybackTime: TimeInterval = 0
    @Published var volume: Float = 0.1
    
    var timer:Timer?
    
    // Metodo para controlar o tempo
    @Published var currentTime: TimeInterval = 0
    
    var duration: TimeInterval {
        audioPlayer?.duration ?? 0
    }
    
    var isPlaying: Bool {
        audioPlayer?.isPlaying ?? false
    }
    
    @objc func timeEllapsed() {
        currentTime = audioPlayer?.currentTime ?? 0
    }
    
    @objc func playMusic(index: Int) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MusicController.timeEllapsed), userInfo: nil, repeats: true)
        
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
    
    func setVolume() {
        audioPlayer?.volume = volume
    }
    
    func setCurrentTime() {
        audioPlayer?.currentTime = currentTime
    }
}

extension MusicController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        // Lidar com o evento de reprodução concluída, se necessário.
    }
}

