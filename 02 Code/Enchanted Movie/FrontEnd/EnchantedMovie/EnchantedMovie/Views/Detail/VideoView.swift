//
//  VideoView.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/22.
//
import SwiftUI
struct VideoView: View {
    @State var movieInfo: MovieModel
    @State private var newComment: String = ""
//    @State private var comments: [MovieCommentModel] = movieComments
    @Environment(\.dismiss) var dismiss
//    @State private var comments: [MovieCommentModel]? = movieInfo.movieComments
    @State var folderisTapped = false
    @State var heartisTapped = false
    @State var starisTapped = false
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            let safeArea = geometry.safeAreaInsets
            ZStack {
               
//                    .background(.ultraThinMaterial)
                Image("Background 2")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .background(.ultraThinMaterial)
                    .opacity(0.1)
                HStack {
                    Image(systemName: "arrow.backward")
                        .animatableFont(size: 18)
                        .fontWeight(.bold)
                        .foregroundColor(.pink)
                        .onTapGesture {
                            withAnimation {
                                dismiss()
                            }
                        }
                        .offset(x: 18)
             
                    
                    Text(movieInfo.movieName)
                        .font(.title3)
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .offset(x: 3)
                    
                    Image(systemName: folderisTapped ?"folder.fill.badge.plus":"folder.badge.plus")
                        .animatableFont(size: 18)
                        .fontWeight(.bold)
                        .foregroundColor(.pink)
                        .offset(x: -20)
                        .onTapGesture {
                            withAnimation {
                                folderisTapped.toggle()
    //                            dismiss()
                            }
                        }
                }
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.vertical, 3)

                VideoPlayer(size: size, safeArea: safeArea, movieUrl: movieInfo.movieUrl)
                    .ignoresSafeArea()
                    .offset(y:-260)
                Text("Movie Comment".uppercased())
                    .font(.system(size:12).bold())
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .offset(y: -105)
                ScrollView {
                    commentListView
                    Rectangle()
                        .opacity(0)
                        .frame(height: 600)
                }
//                .padding(.bottom, 30)
                .offset(y: 340)
                HStack {
                    ZStack {
                        TextField("   Say something...", text: $newComment)
                            .padding(.vertical, 10)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.pink.opacity(0.3), lineWidth: 1)
                            )
                            .padding(.horizontal, 50)
                        .offset(x: -25,y:8)
                        
                        Button{
                            // Create a new comment and add it to the list
                            let newId = movieInfo.movieComments.count + 1
                            let newComment = MovieCommentModel(id: newId,
                                                               movieComment_userName: "Enchanted",
                                                               movieComment_userAvatar: "Avatar 1",
                                                               movieComment_content: self.newComment,
                                                               movieComment_time: "2023-05-31")
                            movieInfo.movieComments.append(newComment)
                            CommentManager.shared.saveComments(movieInfo.movieComments)
                            // Clear the input field
                            self.newComment = ""
                            // Create a new comment and add it to the list
//                            let newId = movieInfo.movieComments.count + 1
//                            let newComment = MovieCommentModel(id: newId,
//                                                               movieComment_userName: "Enchanted",
//                                                               movieComment_userAvatar: "Avatar 1",
//                                                               movieComment_content: self.newComment,
//                                                               movieComment_time: "2023-05-31")
//                            movieInfo.movieComments.append(newComment)
////                            UserDefaultsManager.saveComments(movieInfo.movieComments)
//                            // Clear the input field
//                            self.newComment = ""
                        } label: {
                            Image(systemName: "pencil")
                                .foregroundColor(.pink)
                        }
                        .offset(x: 60, y: 6)
                    }
                    HStack(spacing: 40) {
                        Image(systemName: heartisTapped ? "heart.fill":"heart")
                            .font(.system(size: 25))
                            .foregroundColor(.pink)
                            .onTapGesture {
                                withAnimation {
                                    heartisTapped.toggle()
                                }
                            }
                        Image(systemName: starisTapped ? "star.fill":"star")
                            .font(.system(size: 25))
                            .foregroundColor(.pink)
                            .onTapGesture {
                                withAnimation {
                                    starisTapped.toggle()
                                }
                            }
                    }
                    .offset(x: -50, y:8)

                }
                .frame(height: 70)
//                .opacity(0.5)
                .background(.ultraThinMaterial)
                .offset(y:400)
               

                
            }
            .background(Color("Background"))
        }
    }
    
    var commentListView: some View {
        ForEach(movieInfo.movieComments) { comment in
            VStack {
                HStack {
                    Image(comment.movieComment_userAvatar)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(40)
                        .padding(3)
                        .background(.ultraThinMaterial)
                        .backgroundStyle(cornerRadius: 40, opacity: 0.4)
                    VStack(alignment: .leading, spacing: 5) {
                        Text(comment.movieComment_userName)
                            .animatableFont(size: 15)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                        Text(comment.movieComment_time.prefix(10))
                            .animatableFont(size: 11)
                            .fontWeight(.medium)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Button {
                        // Perform the action when the thumbs-up button is pressed
                    } label: {
                        Image(systemName: "hand.thumbsup")
                            .animatableFont(size: 13)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.horizontal, 20)
                .frame(height: 50)
                
                Text(comment.movieComment_content)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 15))
                    .padding(.horizontal, 48)
                    .lineSpacing(5)
                    .offset(x: 28)
            }
            .padding(.vertical, 10)
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(movieInfo: actionMovies[0])
    }
}
