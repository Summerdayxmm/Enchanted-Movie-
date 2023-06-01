//
//  CommunityView.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct CommunityView: View {
    var columns = [GridItem(.adaptive(minimum: 300), spacing: 20)]
    @ObservedObject var service = CommunityTalkService.shared
    @State var show = false
    @State var showStatusBar = true
    @State var showCourse = false
    @State var selectedCourse: Course = courses[0]
    @State var contentHasScrolled = false
    @State var communityTap = false
    @State private var selectedTalk: CommunityTalk? = nil
//    @State private var communityTalks: [CommunityTalk] = []
//    var talk: CommunityTalk
    @EnvironmentObject var model: Model
    @Namespace var namespace
    
    
    var body: some View {
        ZStack {

            Color("Background").ignoresSafeArea()
            
    
            ScrollView {
                scrollDetection
                
                Rectangle()
                    .frame(width: 100, height: 50)
                    .opacity(0)
//                communitySection
//                    .offset(y:8)
                
//                ForEach(service.communityTalks) { talk in
//                    TalkList(talk: talk )
//                        .onTapGesture {
//                            withAnimation {
//                                communityTap.toggle()
//                            }
//                        }
//                        .fullScreenCover(isPresented: $communityTap) {
//                            withAnimation {
////                                print(talk)
//                                CommunityDetailView(communityTap: $communityTap, talk: talk)
//                            }
//                        }
//                }
                ForEach(service.communityTalks.indices, id: \.self) { index in
                    TalkList(talk: service.communityTalks[index])
                        .onTapGesture {
                            //talk.id
                            withAnimation {
                                selectedTalk = service.communityTalks[index]
                                communityTap.toggle()
                            }
                        }
                }
                .fullScreenCover(item: $selectedTalk) { talk in
                    CommunityDetailView(talk: talk, communityTalks: $service.communityTalks)
                }

//                .fullScreenCover(item: $selectedTalk) { talk in
//                    CommunityDetailView(talk: talk, communityTalks: $service.communityTalks) { updatedTalk in
//                        // 查找更新后talk的索引
//                        if let index = service.communityTalks.firstIndex(where: { $0.id == updatedTalk.id }) {
//                            // 使用最新值更新talk
//                            service.communityTalks[index] = updatedTalk
//                        }
//                    }
//
////                    withAnimation {
//////                        CommunityDetailView(talk: talk)
////
////                    }
//                }

            }
            .onAppear {
                service.getCommunityTalks()
            }
            .coordinateSpace(name: "scroll")
            .background(ZStack {
//                Image("Blob 1").offset(x: 250, y: -200)
                Image("Blob 1")
//                    .resizable()
                    .offset(x: 400, y: 240)
                    .opacity(0.4)
                Image("Blob 1")
//                    .resizable()
                    .offset(x: -450, y: -20)
//                    .opacity(0.8)
            })
        }
        .onChange(of: model.showDetail) { value in
            withAnimation {
                model.showTab.toggle()
                model.showNav.toggle()
                showStatusBar.toggle()
            }
        }
        .overlay(NavigationBar(title: "Community", contentHasScrolled: $contentHasScrolled))
        .statusBar(hidden: !showStatusBar)
        
    }
    struct TalkList: View {
            let talk: CommunityTalk
            var body: some View {
                VStack {
                    HStack {
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
                    .padding(.vertical, 10)
                    Text(talk.community_talk_content)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 14))
                        .padding(.horizontal, 20)
                        .lineSpacing(5)
                        .lineLimit(2)

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
                    .padding(.vertical, 5)
                    Divider()
                        .padding(.horizontal, 20)
                        .padding(.vertical, 2)
                    HStack(spacing: 120) {
                        Image(systemName: "hand.thumbsup")
                            .animatableFont(size: 13)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                        Image(systemName: "bubble.left")
                            .animatableFont(size: 13)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                        Image(systemName: "square.and.arrow.up")
                            .animatableFont(size: 13)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }
                .frame(height: 320)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .backgroundStyle(cornerRadius: 20, opacity: 0.4)
                .padding(.horizontal, 5)

//                ForEach(talk.community_talk_comment) { comment in
//                    VStack {
//                        HStack {
//                            WebImage(url: URL(string: comment.community_talk_comment_userAvatar))
//                                .resizable()
//                                .frame(width: 40, height: 40)
//                                .cornerRadius(40)
//                                .padding(3)
//                                .background(.ultraThinMaterial)
//                                .backgroundStyle(cornerRadius: 40, opacity: 0.4)
//                            VStack(alignment:.leading, spacing: 5) {
//                                Text(comment.community_talk_comment_userName)
//                                    .animatableFont(size: 15)
//                                    .fontWeight(.medium)
//                                    .foregroundColor(.primary)
//                                Text(comment.community_talk_comment_time.prefix(10))
//                                    .animatableFont(size: 11)
//                                    .fontWeight(.medium)
//                                    .foregroundColor(.secondary)
//                            }
//                            Spacer()
//                            Button {} label: {
//                                Image(systemName: "hand.thumbsup")
//                                    .animatableFont(size: 13)
//                                    .fontWeight(.bold)
//                                    .foregroundColor(.secondary)
//                            }
//                        }
//                        .padding(.horizontal,20)
//                        .frame(height: 50)
//                        Text(comment.community_talk_comment_content)
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                            .font(.system(size: 14))
//                            .padding(.horizontal, 48)
//                            .lineSpacing(5)
//                            .offset(x: 28)
//                    }
////                    .frame(height: 120)
//                    .padding(.vertical, 10)
//                }
            }
        }
    
    var communitySection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(movies) { item in
                    SmallCommunity(movie: item)
//                        .onTapGesture {
//                            withAnimation {
//                                showView = true
//                            }
//                        }
                    
                }
            }
//            .padding(20)
            .padding(.horizontal ,20)
            .padding(.bottom, 20)
           
        }
        .frame(maxHeight: .infinity)
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            let offset = proxy.frame(in: .named("scroll")).minY
            Color.clear.preference(key: ScrollPreferenceKey.self, value: offset)
        }
        .onPreferenceChange(ScrollPreferenceKey.self) { value in
            withAnimation(.easeInOut) {
                if value < 0 {
                    contentHasScrolled = true
                } else {
                    contentHasScrolled = false
                }
            }
        }
    }
}

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
            .environmentObject(Model())
    }
}
