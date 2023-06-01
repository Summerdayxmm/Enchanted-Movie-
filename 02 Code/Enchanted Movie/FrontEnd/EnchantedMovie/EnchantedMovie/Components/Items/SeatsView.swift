//
//  SeatesView.swift
//  EnchantedMovie
//
//  Created by Enchanted on 2023/5/29.
//

import SwiftUI
struct SeatView: View {
    let rowIndex: Int
    let columnIndex: Int
    let onSelect: (Int, Int) -> Void
    @Binding var isSelected: Bool
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        Button(action: {
            isSelected.toggle()
            if isSelected {
                onSelect(rowIndex, columnIndex)
            }
        }) {
            if !isSelected {
                Image(systemName: "app")
                    .font(.system(size: 25))
                    .foregroundColor(colorScheme == .dark ? .orange : .indigo)
    //                .fill(isSelected ? Color.green : Color.gray)
    //                .frame(width: 20, height: 20)
            } else {
                Image(systemName: "app.fill")
                    .font(.system(size: 25))
                    .foregroundColor(colorScheme == .dark ? .teal : .green)
//                    .background()
    //                .fill(isSelected ? Color.green : Color.gray)
    //                .frame(width: 20, height: 20)
            }

        }
    }
}

struct MovieTheaterView: View {
    @State var seatStates: [[Bool]]
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack(spacing: 10) {

            Group {
                ForEach(0..<seatStates.count, id: \.self) { rowIndex in
                    HStack(spacing: 10) {
                        ForEach(0..<seatStates[rowIndex].count, id: \.self) { columnIndex in
                            SeatView(rowIndex: rowIndex, columnIndex: columnIndex, onSelect: { row, column in
                                print("Selected seat at row \(row + 1), column \(column + 1)")
                            }, isSelected: $seatStates[rowIndex][columnIndex])
                        }
                    }
                }
            }
            .background(colorScheme == .dark ?.orange.opacity(0.2):.indigo.opacity(0.1))
            .background(.ultraThinMaterial)
            .backgroundStyle(cornerRadius: 15, opacity: 0)
            .offset(y: -20)
            
            HStack(spacing: 15) {
                HStack {
                    Image(systemName: "app")
                        .font(.system(size: 20))
                        .foregroundColor(colorScheme == .dark ? .orange : .indigo)
                    Text("Avaliable")
                }
                HStack {
                    Image(systemName: "app.fill")
                        .font(.system(size: 20))
                        .foregroundColor(colorScheme == .dark ? .pink:.indigo)
                    Text("Reserved")
                }
                
                HStack {
                    Image(systemName: "app.fill")
                        .font(.system(size: 20))
                        .foregroundColor(colorScheme == .dark ? .teal : .green)
                    Text("Selected")
                }
                

                
            }
            .frame(width: 360, height: 50)
            .background(.indigo.opacity(0.1))
            .background(.ultraThinMaterial)
            .backgroundStyle(cornerRadius: 15, opacity: 0)
            .offset(y: 20)
            

            
        }
    }
}


struct SestsView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @State var cinemaMovie: CinemaMovieModel
    @State var time01Tapped = false
    @State var time02Tapped = false
    @State var time03Tapped = false
    @State var isReserved = false
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
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
         
                
                Text("Choose Seats")
                    .font(.title3)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .offset(x: -18)
                
              
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.vertical, 10)
            
            VStack(spacing: 70) {
                Image(colorScheme == .dark ? "frontSeat" : "frontSeat-light")
                    .padding(.top, 55)
                    .glow(color: colorScheme == .dark ? .pink :.indigo, radius: 20)
                MovieTheaterView(seatStates: Array(repeating: Array(repeating: false, count: 10), count: 8))
//                timeSelector
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.vertical, 80)
            .offset(y: -40)
            
            VStack(alignment: .leading, spacing: 20) {
//                HStack {
//                    Text("Movie Name:".uppercased())
//                        .foregroundColor(.secondary)
//                    Text(cinemaMovie.cinemaMovie_name)
//                        .foregroundColor(.primary)
//                }
//                HStack {
//                    Text("Release Time:".uppercased())
//                        .foregroundColor(.secondary)
//                    Text(cinemaMovie.cinemaMovie_releaseTime)
//                        .foregroundColor(.primary)
//                }
                Text("Choose A Time :".uppercased())
                    .font(.system(size: 15).bold())
                    .foregroundColor(.secondary)
                    .offset(y: -20)
                HStack(spacing: 30) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 100, height: 60)
                            .foregroundColor(time01Tapped ? .indigo.opacity(0.5):.indigo.opacity(0.1))
                            .background(.ultraThinMaterial)
                            .backgroundStyle(cornerRadius: 15, opacity: 0)
                        Text(cinemaMovie.cinemaMovieTime[0])
                            .foregroundColor(.primary)
                    }
                    .onTapGesture {
                        withAnimation {
                            time01Tapped.toggle()
                            time02Tapped = false
                            time03Tapped = false
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 100, height: 60)
                            .foregroundColor(time02Tapped ? .indigo.opacity(0.5) :.indigo.opacity(0.1))
                            .background(.ultraThinMaterial)
                            .backgroundStyle(cornerRadius: 15, opacity: 0)
                        Text(cinemaMovie.cinemaMovieTime[1])
                            .foregroundColor(.primary)
                    }
                    .onTapGesture {
                        withAnimation {
                            time01Tapped = false
                            time02Tapped.toggle()
                            time03Tapped = false
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 100, height: 60)
                            .foregroundColor(time03Tapped ? .indigo.opacity(0.5) : .indigo.opacity(0.1))
                            .background(.ultraThinMaterial)
                            .backgroundStyle(cornerRadius: 15, opacity: 0)
                        Text(cinemaMovie.cinemaMovieTime[2])
                            .foregroundColor(.primary)
                    }
                    .onTapGesture {
                        withAnimation {
                            time01Tapped = false
                            time02Tapped = false
                            time03Tapped.toggle()
                        }
                    }
                }
                .offset(y: -20)
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 360, height: 60)
                        .foregroundColor(isReserved ? .indigo.opacity(0.5) :.indigo.opacity(0.1))
                        .background(.ultraThinMaterial)
                        .backgroundStyle(cornerRadius: 15, opacity: 0)
                    Text("Reservation")
                        .font(.system(size: 20).bold())
                        .foregroundColor(.primary)
                }
                
                .onTapGesture {
                    withAnimation {
                        isReserved.toggle()
                        dismiss()
                    }
                    
                }
                .offset(y: 10)
                
            }
            .offset(y: 300)
            
        }

    }
//    var timeSelector: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 16) {
//                ForEach(movies) { item in
//
//                }
//            }
////            .padding(20)
//            .padding(.horizontal ,20)
//            .padding(.bottom, 40)
//        }
////        .fullScreenCover(isPresented: $showView) {
////            CommunityView()
////        }
//
//    }
}

struct SestsView_Previews: PreviewProvider {
    static var previews: some View {
        SestsView(cinemaMovie: cinemaMovies[0])
    }
}
