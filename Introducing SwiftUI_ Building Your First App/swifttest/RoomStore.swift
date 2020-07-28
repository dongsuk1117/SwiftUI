//
//  RoomStore.swift
//  swifttest
//
//  Created by dongsuk Jo on 2020/07/27.
//  Copyright © 2020 dongsuk Jo. All rights reserved.
//

import SwiftUI
import Combine

class RoomStore: ObservableObject {
    @Published var rooms: [Room] {
        didSet { didChange.send() }
    }
    
    init(rooms: [Room] = []) {
        self.rooms = rooms
    }
    
    var didChange = PassthroughSubject<Void, Never> ()
}
