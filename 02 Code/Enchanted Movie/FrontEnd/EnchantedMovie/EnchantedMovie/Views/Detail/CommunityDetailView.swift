//
//  CommunityDetailView.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct CommunityDetailView: View {
    @State var text = ""
    @State var talkComment: [CommunityTalkComment] = []
    @ObservedObject var service = CommunityTalkService.shared
    @State private var isAppeared = false  // 添加isAppeared属性
//    @Binding var communityTap: Bool
    @Environment(\.dismiss) var dismiss
//    var talk: CommunityTalk
    var talk: CommunityTalk
    
    @Binding var communityTalks: [CommunityTalk]
//    var updateTalk: ((CommunityTalk) -> Void)?
//    var updateTalk: ((CommunityTalk) -> Void)?
//    @State private var comments: [CommunityTalkComment] = []
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {

            
               Rectangle()
                  .frame(width: 100, height: 80)
                  .opacity(0)
                Text(talk.community_talk_content)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 14).bold())
                    .padding(.horizontal, 20)
                    .lineSpacing(5)
//                    .lineLimit(2)
               HStack {
                   WebImage(url: URL(string: talk.community_talk_image1))
                       .resizable()
                       .frame(width: 120, height: 120)
                       .clipShape(RoundedRectangle(cornerRadius: 5))
                   WebImage(url: URL(string: talk.community_talk_image2))
                       .resizable()
                      .frame(width: 120, height: 120)
                      .clipShape(RoundedRectangle(cornerRadius: 5))
               }
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .padding(.horizontal, 20)
                  .padding(.vertical, 20)
                Divider()
                    .padding(.horizontal, 20)
                
                CommentList(comments: talkComment)
//                 CommentList(comments: service.communityTalks[1].community_talk_comment)
                  
             }
            .onAppear {
                        if isAppeared && service.commentAdded {  // 检查isAppeared和commentAdded的值
                            service.getCommunityTalks()
                            service.commentAdded = false  // 设置commentAdded为false
                        }
                        isAppeared = true
                    print("---------------------------------------------")
                    print(talk.community_talk_comment)
                    print("---------------------------------------------")
                        talkComment=talk.community_talk_comment
              
                    }

//            .offset(y: 150)

            HStack {
                Image(systemName: "chevron.backward")
                    .animatableFont(size: 13)
                    .fontWeight(.bold)
                    .foregroundColor(.pink)
                    .onTapGesture {
                        withAnimation {
                            dismiss()
                        }
                    }
                WebImage(url: URL(string: talk.community_talk_userAvatar))
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(40)
                    .padding(5)
                    .background(.ultraThinMaterial)
                    .backgroundStyle(cornerRadius: 40, opacity: 0.4)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .padding(.horizontal, 20)
                VStack(alignment:.leading, spacing: 5) {
                    Text(talk.community_talk_userName)
                        .animatableFont(size: 15)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                    Text(talk.community_talk_time.prefix(10))
                        .animatableFont(size: 11)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                Button{
                    
                }label: {
                    HStack(spacing: 5) {
                        Image(systemName: "plus")
                            .animatableFont(size: 12)
                            .fontWeight(.bold)
                            .foregroundColor(.pink)
                        Text("Follow")
                            .animatableFont(size: 12)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    }
//                    .background(.ultraThinMaterial)
                    .frame(width: 70, height: 25)
                    .backgroundStyle(cornerRadius: 25)
//                    .modifier(OutlineOverlay(cornerRadius: 25))
                }
            }
            .padding(.horizontal,20)
            .frame(height: 80)
            .background(.ultraThinMaterial)
            .offset(y:-400)

            HStack {
                TextField("Say Something", text: $text)
//                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .overlay(
                        HStack {
                            Image(systemName: "pencil.line")
                                .frame(width: 36, height: 36)
                                .background(.ultraThinMaterial)
                                .cornerRadius(14)
                                .shadow(color: .pink, radius: 0.5)
                                .modifier(OutlineOverlay(cornerRadius: 14))
                                .offset(x: 190)
                                .foregroundStyle(.pink)
                                .accessibility(hidden: true)
                                .onTapGesture {
                                    if text != "" {
                                        let comment = CommunityComment(
                                                    id: talk.id,
                                                    community_talk_comment_userName: "Wang",
                                                    community_talk_comment_userAvatar: "http://127.0.0.1:8000/media/UserAvatar/05.jpeg",
                                                    community_talk_comment_content: text
                                                )
                                        let comment2 = CommunityTalkComment(
                                                    id: talk.id,
                                                    community_talk_comment_userName: "Wang",
                                                    community_talk_comment_userAvatar: "http://127.0.0.1:8000/media/UserAvatar/05.jpeg",
                                                    community_talk_comment_content: text,
                                                    community_talk_comment_time:"122222222222222222222"
                                                )
                                        
                                        talkComment.append(comment2)
//                                        talkComment.append(comment2)
                                        text = ""
                                        print("---------------------------------------------")
                                        print(talkComment)
                                        print("---------------------------------------------")
                                        service.addComment(comment: comment) { success in
                                            if success {

//                                                talkComment.removeAll()
                                                print("Comment added successfully")
                                                service.commentAdded = true

                                            
                                                
                                            } else {
                                                print("Failed to add comment")
                                            }
                                        }
                                    }
                                    print(talk.id)


                                }
                            Spacer()
                        }
                    )
                    .foregroundStyle(.primary)
//                    .background(.indigo)
                    .padding(15)
                    .padding(.leading, 40)
                    .background(.ultraThinMaterial)
                    .cornerRadius(20)
//                    .customField(icon: "pencil.line")
                    .frame(width: 300)
//                    .padding(.horizontal, 20)
                    .shadow(color: .pink, radius: 0.2)
                    .modifier(OutlineOverlay(cornerRadius: 20))
                    .offset(x:-10,y: 10)
                   



                HStack(spacing: 20) {
                    Image(systemName: "hand.thumbsup")
                        .animatableFont(size: 18)
                        .fontWeight(.bold)
                    .foregroundColor(.secondary)
                    Image(systemName: "bubble.left")
                        .animatableFont(size: 18)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                }
                .offset(y:9)

            }
            .frame(maxWidth: .infinity)
//            .background(
//                .gray.opacity(0.2)
////            Image("Blob 1")
////                .offset(y:230)
//////                .opacity(0.3)
//            )
////            .frame(height: 80)
            .background(.ultraThinMaterial)
            .frame(maxHeight: .infinity, alignment: .bottom)

//
        }

        
        
    }

    struct CommentList: View {
        let comments: [CommunityTalkComment]
            var body: some View {
                ForEach(comments) { comment in
                    VStack {
                        HStack {
                            WebImage(url: URL(string: comment.community_talk_comment_userAvatar))
                                .resizable()
                                .frame(width: 40, height: 40)
                                .cornerRadius(40)
                                .padding(3)
                                .background(.ultraThinMaterial)
                                .backgroundStyle(cornerRadius: 40, opacity: 0.4)
                            VStack(alignment:.leading, spacing: 5) {
                                Text(comment.community_talk_comment_userName)
                                    .animatableFont(size: 15)
                                    .fontWeight(.medium)
                                    .foregroundColor(.primary)
                                Text(comment.community_talk_comment_time.prefix(10))
                                    .animatableFont(size: 11)
                                    .fontWeight(.medium)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Button {} label: {
                                Image(systemName: "hand.thumbsup")
                                    .animatableFont(size: 13)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal,20)
                        .frame(height: 50)
                        Text(comment.community_talk_comment_content)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 14))
                            .padding(.horizontal, 48)
                            .lineSpacing(5)
                            .offset(x: 28)
                    }
//                    .frame(height: 120)
                    .padding(.vertical, 10)
                }
            }
        }
    
    var comment: some View {
        VStack {
            
            HStack {
                Image("Avatar 3")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(40)
                    .padding(3)
                    .background(.ultraThinMaterial)
                    .backgroundStyle(cornerRadius: 40, opacity: 0.4)
    //                    .frame(maxWidth: .infinity, alignment: .leading)
    //                    .padding(.horizontal, 20)
                VStack(alignment:.leading, spacing: 5) {
                    Text("Enchanted")
                        .animatableFont(size: 15)
                        .fontWeight(.medium)
                        .foregroundColor(.primary)
                    Text("Released on 05-10")
                        .animatableFont(size: 11)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                Button{
                    
                }label: {
                    Image(systemName: "hand.thumbsup")
                        .animatableFont(size: 13)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.horizontal,20)
            .frame(height: 50)
            Text("And when they let you down You get up off the ground. Cause morning rolls around and it’s another day of sun. ")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 14))
                .padding(.horizontal, 48)
                .lineSpacing(5)
                .offset(x: 28)
//                    .lineLimit(2)
                
               
        }
        .frame(height: 120)
        .padding(.vertical, 10)
//        .background(.ultraThinMaterial)


    }
}



struct CommunityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let fakeComment1 = CommunityTalkComment(id: 1,
                                   community_talk_comment_userName: "Enchanted",
                                   community_talk_comment_userAvatar: "http://127.0.0.1:8000/media/UserAvatar/05.jpeg",
                                   community_talk_comment_content: "And when they let you down You get up off the ground. Cause morning rolls around and it’s another day of sun.",
                                   community_talk_comment_time: "2023-05-25T11:53:09.381945Z")

        let fakeComment2 = CommunityTalkComment(id: 2,
                                   community_talk_comment_userName: "Enchanted",
                                   community_talk_comment_userAvatar: "http://127.0.0.1:8000/media/UserAvatar/05.jpeg",
                                   community_talk_comment_content: "when they let you down You get up off the ground.And when they let you down You get up off the ground. Cause morning rolls around and it’s another day of sun. And when they let you down You get up off the ground.",
                                   community_talk_comment_time: "2023-05-25T12:40:02.685489Z")

        let fakeTalk = CommunityTalk(id: 1,
                                     community_talk_comment: [fakeComment1, fakeComment2],
                                     community_talk_image1: "http://127.0.0.1:8000/media/Community/05.jpeg",
                                     community_talk_image2: "http://127.0.0.1:8000/media/Community/06.jpeg",
                                     community_talk_userName: "Enchanted",
                                     community_talk_userAvatar: "http://127.0.0.1:8000/media/UserAvatar/05.jpeg",
                                     community_talk_content: "And when they let you down You get up off the ground. Cause morning rolls around and it’s another day of sun. And when they let you down You get up off the ground.And when they let you down You get up off the ground. Cause morning rolls around and it’s another day of sun. And when they let you down You get up off the ground.",
                                     community_talk_time: "2023-05-25T11:53:10.424102Z")
        
        let communityTalks: [CommunityTalk] = [fakeTalk]  // 添加 communityTalks 数据
        
        CommunityDetailView(talk: fakeTalk, communityTalks: .constant(communityTalks))
    }
}

