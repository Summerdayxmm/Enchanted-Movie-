//
//  MyTicketView.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/29.
//

import SwiftUI

struct MyTicketView: View {
    @State var contentHasScrolled = false
    @EnvironmentObject var model: Model
    @Environment(\.dismiss) var dismiss
    @State var showBackButton = true
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            content
                .background(Image("Blob 1").offset(x: -180, y: 300))
        }
    }
    
    var content: some View {
        ScrollView {
            scrollDetection
            if showBackButton {
                Image(systemName: "chevron.backward")
                    .animatableFont(size: 13)
                    .fontWeight(.bold)
                    .foregroundColor(.pink)
                    .onTapGesture {
                        withAnimation {
                            dismiss()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                    .offset(y: 24)
            }
            sectionsSection
                .padding(.vertical, 70)
                .padding(.bottom, 50)
        }
        .coordinateSpace(name: "scroll")
        .overlay(NavigationBar(title: "My Ticket", contentHasScrolled: $contentHasScrolled).offset(x: 20))
    }
    
    var sectionsSection: some View {
        VStack(spacing: 16) {
            ForEach(Array(courseSections.enumerated()), id: \.offset) { index, section in
                SectionRow(section: section)
                if index != courseSections.count - 1 {
                    Divider()
                }
            }
        }
        .padding(20)
        .background(.ultraThinMaterial)
        .backgroundStyle(cornerRadius: 30)
        .padding(.horizontal, 20)
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            let offset = proxy.frame(in: .named("scroll")).minY
            Color.clear.preference(key: ScrollPreferenceKey.self, value: offset)
        }
        .onPreferenceChange(ScrollPreferenceKey.self) { offset in
            withAnimation(.easeInOut) {
                if offset < 0 {
                    contentHasScrolled = true
                } else {
                    contentHasScrolled = false
                }
            }
        }
    }
}

struct MyTicketView_Previews: PreviewProvider {
    static var previews: some View {
        MyTicketView()
            .environmentObject(Model())
    }
}
