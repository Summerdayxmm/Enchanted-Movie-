//
//  CustomVideoPlayer.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/22.
//

import SwiftUI
import AVKit

// Custom Video Player
struct CustomVideoPlayer: UIViewControllerRepresentable {
    let player: AVPlayer
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = player
        controller.showsPlaybackControls = false
        
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}

