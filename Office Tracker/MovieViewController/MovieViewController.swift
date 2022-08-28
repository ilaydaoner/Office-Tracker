//
//  MovieViewController.swift
//  Office Tracker
//
//  Created by Mac on 28.08.2022.
//

import UIKit
import AVFoundation
import AVKit

class MovieViewController: UIViewController {
    let videoName = "Istanbul_Tanıtım"
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var videContentView: UIView!
    var myPlayer: AVPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVideoPlayer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    func configureVideoPlayer() {
        guard let path = Bundle.main.path(forResource: videoName, ofType:"mp4") else {
            debugPrint("video  not found")
            return
        }
        myPlayer = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: myPlayer)
        playerLayer.frame = videContentView.bounds
        videContentView.layer.addSublayer(playerLayer)
    }

    @IBAction func playPauseVideo(_ sender: UIButton) {
        playPause()
    }

        
        
        func playPause() {
            switch myPlayer.timeControlStatus {
            case .playing:
                pause()
            case .paused:
               play()
            default:
                break
            }
        }
        
        private func play() {
            myPlayer.play()
            playPauseButton.setTitle("Pause", for: .normal)
        }
        
        private func pause() {
            myPlayer.pause()
            playPauseButton.setTitle("Play", for: .normal)
        }




