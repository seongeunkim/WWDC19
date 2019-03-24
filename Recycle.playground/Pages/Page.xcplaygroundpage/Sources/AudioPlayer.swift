import AVFoundation

public class AudioPlayer {

    var backgroundMusic: AVAudioPlayer?

    public init() {
        do {
            backgroundMusic = try AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "backgroundMusic", withExtension: "mp3")!)
        } catch {}
        backgroundMusic?.prepareToPlay()
    }

    public func play() {
        backgroundMusic?.numberOfLoops = -1
        backgroundMusic?.volume = 1
        backgroundMusic?.play()
    }

    public func stop() {
        backgroundMusic?.stop()
    }

    public func fadeMusic() {
        backgroundMusic?.setVolume(0, fadeDuration: 12)
    }
}
