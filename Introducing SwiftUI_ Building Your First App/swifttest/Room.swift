//
//  Room.swift
//  swifttest
//
//  Created by dongsuk Jo on 2020/07/27.
//  Copyright © 2020 dongsuk Jo. All rights reserved.
//

import Foundation

struct Room: Identifiable {
    var id = UUID()
    var name: String
    var capacity: Int
    var hasVideo: Bool
    
    var imageName: String {return name }
    var thumbnailName: String { return name + "Thumb" }
}

#if DEBUG

let testData = [
    Room(name: "Image1", capacity: 6, hasVideo: true),
    Room(name: "Image2", capacity: 12, hasVideo: false),
    Room(name: "Image3", capacity: 18, hasVideo: false),
    Room(name: "Image4", capacity: 24, hasVideo: false),
    Room(name: "Image5", capacity: 30, hasVideo: false)
]

#endif
