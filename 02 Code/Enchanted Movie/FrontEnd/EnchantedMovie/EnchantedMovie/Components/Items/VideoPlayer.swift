//
//  VideoView.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/22.
//

import SwiftUI
import AVKit

struct VideoPlayer: View {
    var size: CGSize
    var safeArea: EdgeInsets
    @State var movieUrl: String = "video 1"
//    @State var movieUrl = ""
    @State private var player: AVPlayer? = nil
    // View Properties
//    @State private var player: AVPlayer? = {
//        if let bundle = Bundle.main.path(forResource: "video 1", ofType: "mp4") {
//            return .init(url: URL(filePath: bundle))
//        }
//
//        return nil
//    }()
//
    @State private var showPlayerControlls: Bool = false
    @State private var isPlaying: Bool = false
    @State private var timeoutTask: DispatchWorkItem?
    @State private var isFinishedPlaying:Bool = false
    @GestureState private var isDragging : Bool = false
    @State private var isSeeking: Bool = false
    @State private var progress: CGFloat = 0
    @State private var lastDraggedProgress: CGFloat = 0
    var body: some View {
        VStack(spacing: 0) {
            let videoPlayerSize: CGSize = .init(width: size.width, height: size.height / 3.5)
            
            //Custom Video Player
            ZStack {
                if player != nil {
                    CustomVideoPlayer(player: player!)
                        .overlay {
                            Rectangle()
                                .fill(.black.opacity(0.4))
                                .opacity(showPlayerControlls || isDragging ? 1 : 0)
                                .animation(.easeInOut(duration: 0.35), value: isDragging)
                                .overlay {
                                    PlayBackControls()
                                }
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.35)) {
                                showPlayerControlls.toggle()
                            }
                            // Timing Out Controls, Only If the Video is Playing
                            if isPlaying {
                                timeoutControls()
                            }
                        }
                        .overlay(alignment: .bottom) {
                            VideoSeekerView(videoPlayerSize)
                        }
                       
                }
            }
            .frame(width: videoPlayerSize.width, height: videoPlayerSize.height)
            
//            ScrollView(.vertical, showsIndicators: false) {
////                VStack {
////                    Text("hhelo")
////                    CommentList(comments: $comments)
////
////                    CommentInput(comments: $comments)
////                }
//
//                VStack(spacing: 10) {
//                    ForEach(1...5, id: \.self) { index in
//                        GeometryReader {
//                            let size = $0.size
//
//                            Image("0\(index)")
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(width: size.width, height: size.height)
//                                .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
//                        }
//                        .frame(height: 220)
//                    }
//                }
//                .padding(.horizontal, 15)
//                .padding(.top, 30)
//                .padding(.bottom, 15 + safeArea.bottom)
//
//
////                CommentInput(comments: $comments)
////                CommentList(comments: $comments)
//                   
//            }
               
        }
//        .padding(.top, safeArea.top)
        .onAppear {
            if let bundle = Bundle.main.path(forResource: movieUrl, ofType: "mp4") {
                player = .init(url: URL(fileURLWithPath: bundle))
            }
            player?.addPeriodicTimeObserver(forInterval: .init(seconds: 1, preferredTimescale: 1), queue: .main, using: { time in
                /// Calculating Video Progress
                if let currentPlayerItem = player?.currentItem {
                    let totalDuration = currentPlayerItem.duration.seconds
                    guard let currentDuration = player?.currentTime ().seconds else { return }
                    
                    let calculatedProgress = currentDuration / totalDuration
                    if !isSeeking {
                        progress = calculatedProgress
                        lastDraggedProgress = progress
                    }
                    
                    if calculatedProgress == 1 {
                        // video finished playing
                        isFinishedPlaying = true
                        isPlaying = false
                    }
                }
            })
        }
        .onDisappear {
            player?.pause()
        }
    }
    
    
    @ViewBuilder
    func VideoSeekerView(_ videoSize: CGSize) -> some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(.gray)
            Rectangle()
                .fill(.indigo)
                .frame(width: max(size.width * progress, 0))
        }
        .frame(height: 3)
        .overlay(alignment: .leading) {
            Circle()
                .fill(.red)
                .frame(width: 15, height: 15)
                .scaleEffect(showPlayerControlls || isDragging ? 1: 0.001, anchor: progress * size.width > 15 ? .trailing : .leading)
                /// For More Dragging Space
                .frame (width: 50, height: 50)
                .contentShape (Rectangle())
                /// Moving Along side With Gesture Progress
                .offset(x: size.width * progress)
                .gesture(
                    DragGesture()
                        .updating($isDragging, body: { _, out, _ in
                            out = true
                        })
                        .onChanged ({ value in
                            
                            // Cancelling Existing Timeout Task
                            if let timeoutTask {
                                timeoutTask.cancel()
                            }
                            /// Calculating Progress
                            let translationX: CGFloat = value.translation.width
                            let calculatedProgress = (translationX / videoSize.width) + lastDraggedProgress
                            progress = max(min(calculatedProgress, 1), 0)
                            isSeeking = true
                        })
                        .onEnded ({ value in
                            /// Storing Last Known Progress
                            lastDraggedProgress = progress
                            /// Seeking Video To Dragged Time
                            if let currentPlayerItem = player?.currentItem {
                                let totalDuration = currentPlayerItem.duration.seconds
                                player?.seek(to: .init(seconds: totalDuration * progress,
                                                       preferredTimescale: 1))
                                
                                /// Re-Scheduling Timeout Task
                                if isPlaying {
                                    timeoutControls()
                                }
                                
                                /// Releasing With Slight Delay
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    isSeeking = false
                                }
                            }
                        })
            )
            .offset(x: progress * videoSize.width > 15 ? -15 : 0)
            .frame(width: 15, height : 15)
        }
    }
    // Playback Controls View
    @ViewBuilder
    func PlayBackControls() -> some View {
        HStack(spacing: 25) {
            Button {
                
            } label: {
                Image(systemName: "backward.end.fill")
                    .font(.title2)
                    .fontWeight(.ultraLight)
                    .foregroundColor(.white)
                    .padding(15)
                    .background {
                        Circle()
                            .fill(.black.opacity(0.35))
                    }
            }
            // Disabling Button
            // Since we have no action's for it
            .disabled(true)
            .opacity(0.6)
            
            Button {
                if isFinishedPlaying {
                    /// Setting Video to start and Playing Again
                    isFinishedPlaying = false
                    player?.seek (to: .zero)
                    progress = .zero
                    lastDraggedProgress = .zero
                }
                // Changing Video status to Play/Pause based on user input
                if isPlaying {
                    player?.pause()
                    if let timeoutTask {
                        timeoutTask.cancel()
                    }
                } else {
                    player?.play()
                }
                withAnimation(.easeInOut(duration: 0.2)) {
                    isPlaying.toggle()
                }
                
            } label: {
                // Changing Icon based on Video Status
                Image(systemName: isFinishedPlaying ? "arrow.clockwise" : (isPlaying ? "pause.fill" : "play.fill"))
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(15)
                    .background {
                        Circle()
                            .fill(.black.opacity(0.35))
                    }
            }
            .scaleEffect(1.1)
            
            Button {
                
            } label: {
                Image(systemName: "forward.end.fill")
                    .font(.title2)
                    .fontWeight(.ultraLight)
                    .foregroundColor(.white)
                    .padding(15)
                    .background {
                        Circle()
                            .fill(.black.opacity(0.35))
                    }
            }
            .disabled(true)
            .opacity(0.6)
        }
        .opacity(showPlayerControlls && !isDragging ? 1 : 0)
        .animation(.easeInOut(duration: 0.2), value: showPlayerControlls && !isDragging)
    }
    
    //Timing out Play back controls
    //After some 2-5 Seconds
    func timeoutControls() {
        if let timeoutTask {
            timeoutTask.cancel()
        }
        
        timeoutTask = .init(block: {
            withAnimation(.easeInOut(duration: 0.35)) {
                showPlayerControlls = false
            }
        })
        
        if let timeoutTask {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: timeoutTask)
        }
    }
}

struct VideoPlayer_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(movieInfo: actionMovies[0])
    }
}
