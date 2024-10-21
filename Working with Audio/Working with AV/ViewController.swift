//
//  ViewController.swift
//  Working with Audio
//
//  Created by Chaitanya Soni on 21/10/24.
//

import UIKit
import AVKit


class ViewController: UIViewController {
    
    private var player: AVPlayer?
    
    @IBOutlet weak var playerView: PlayerView!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    //        Legend of Zelda - Main Theme on Marimba.mp3
            if let path = Bundle.main.path(forResource: "Legend of Zelda - Main Theme on Marimba", ofType: "mp4") {
                let url = URL(fileURLWithPath: path)
    //            do {
                    player = .init(url: url)
    //                player?.play()
    //                let avplayerVC = AVPlayerViewController()
    //                avplayerVC.player = player
    //                self.present(avplayerVC, animated: true)
    //
    //                let playerLayer = playerView.layer as? AVPlayerLayer
    //                playerLayer?.player = player
    //                player?.play()
                    
                    if let playerVC = self.children.first(where: { $0.isKind(of: AVPlayerViewController.self) }) as? AVPlayerViewController {
                        playerVC.player = player
                    }
                    
    //            } catch {
    //                //show error to user
    //            }
            }
        
        let swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeDetected(_:)))
        swipeGestureLeft.direction = .left
        self.view.addGestureRecognizer(swipeGestureLeft)
        
        let swipeGestureRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeDetected(_:)))
        swipeGestureRight.direction = .right
        self.view.addGestureRecognizer(swipeGestureRight)
    }
    
    @objc func swipeDetected(_ gesture: UISwipeGestureRecognizer) {
        let currentTime = self.player?.currentTime()
        if gesture.direction == .left {
            self.player?.seek(to: CMTime(seconds: currentTime?.seconds.advanced(by: -10) ?? 0,
                                         preferredTimescale: currentTime?.timescale ?? 600))
        } else {
            self.player?.seek(to: CMTime(seconds: currentTime?.seconds.advanced(by: 10) ?? 0,
                                         preferredTimescale: currentTime?.timescale ?? 600))
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            player?.seek(to: .zero)
        }
    }
    
    @IBAction func playButtonAction(_ sender: Any) {
        player?.play()
    }
    
    @IBAction func stopButtonAction(_ sender: Any) {
        player?.pause()
    }
}

