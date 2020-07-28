//
//  RoomDetail.swift
//  swifttest
//
//  Created by dongsuk Jo on 2020/07/27.
//  Copyright © 2020 dongsuk Jo. All rights reserved.
//

import SwiftUI

struct RoomDetail: View {
    let room: Room
    @State private var zoomed = false
    
    var body: some View {
        ZStack (alignment: .topLeading) {
            Image(room.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .navigationBarTitle(Text(room.name), displayMode: .inline)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .onTapGesture {
                    //withAnimation (.easeIn(duration: 2)) { self.zoomed.toggle() }
                    withAnimation { self.zoomed.toggle() }
            }
            
            if room.hasVideo && !zoomed {
                Image(systemName: "video.fill")
                    .font(.title)
                    .padding(.all)
                    .transition(.move(edge: .leading))
            }
        }
    }
}

#if DEBUG

struct RoomDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView{ RoomDetail(room: testData[0]) }
            NavigationView{ RoomDetail(room: testData[1]) }
        }
    }
}

#endif
