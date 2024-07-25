import Foundation
import Combine
import AVFoundation

class MetronomeViewModel: ObservableObject {
    
    static var defaultTempo: Int = 60
    
    @Published var isRunning: Bool = false
    @Published var tempo: Int = defaultTempo {
        didSet {
            if tempo < 1 {
                tempo = 1
            } else if tempo > 300 {
                tempo = 300
            }
            updateTimer()
        }
    }
    @Published var activeCircle: Int = 0
    
    private var timer: Timer?
    private var audioPlayer: AVAudioPlayer?
    
    init() {
        activeCircle = 0
    }
    
    func startTimer() {
        timer?.invalidate()
        
        let interval = 60.0 / Double(tempo)
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] _ in
            self?.updateMetronome()
        }
        
        isRunning = true
        print("메트로놈 실행중")
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        isRunning = false
        activeCircle = 0
        print("메트로놈 정지됨")
    }
    
    func updateTimer() {
        guard isRunning else { return }
        
        timer?.invalidate()
        
        let interval = 60.0 / Double(tempo)
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] _ in
            self?.updateMetronome()
        }
        
        print("템포 업데이트됨: \(tempo)")
    }
    
    private func updateMetronome() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.playSound()
            self.activeCircle = (self.activeCircle + 1) % 4
        }
    }
    
    private func playSound() {
        guard let url = Bundle.main.url(forResource: "Metronome_Demo_1", withExtension: "wav") else {
            print("사운드파일을 찾을 수 없습니다.")
            return
        }
        
        audioPlayer?.stop()
        audioPlayer = nil
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("메트로놈 사운드를 재생할 수 없습니다. 에러코드 : \(error)")
        }
    }
    
    deinit {
        timer?.invalidate()
    }
    
    func increaseTempo() {
        tempo += 1
    }
    
    func decreaseTempo() {
        tempo -= 1
    }
    
    static func setDefaultTempo(_ newTempo: Int) {
        defaultTempo = newTempo
    }
}

