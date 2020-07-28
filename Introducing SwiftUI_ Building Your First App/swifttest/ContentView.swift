//
//  ContentView.swift
//  swifttest
//
//  Created by dongsuk Jo on 2020/07/27.
//  Copyright © 2020 dongsuk Jo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store = RoomStore()
    
    var body: some View {
        NavigationView {
            List {
                
                Section {
                    Button(action: addRoom, label: {
                        Text("Add Room")
                    })
                }
                
                Section {
                    ForEach (store.rooms) { room in
                        RoomCell(room: room)
                    }
                    .onDelete(perform: delete(at:))
                    .onMove(perform: move(from:to:))
                }
                
            }
            .navigationBarTitle("Rooms")
            .navigationBarItems(trailing: EditButton())
            .listStyle(GroupedListStyle())
        }
    }
    
    func addRoom() {
        store.rooms.append(Room(name: "Image5", capacity: 2000, hasVideo: false))
    }
    
    func delete(at offsets: IndexSet) {
        guard let index = Array(offsets).first else { return }
        store.rooms.remove(at: index)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        store.rooms.move(fromOffsets: source, toOffset: destination)
    }
}

#if DEBUG

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: RoomStore(rooms: testData))
            
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.sizeCategory, .extraExtraLarge)
            
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.colorScheme, .dark)
            
            ContentView(store: RoomStore(rooms: testData))
                .environment(\.locale, Locale(identifier: "ko"))
        }
    }
}

#endif

struct RoomCell: View {
    let room: Room
    
    var body: some View {
        NavigationLink(destination: RoomDetail(room: room)) {
            Image(room.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 75.0, height: 65.0)
                .cornerRadius(10.0)
            
            VStack(alignment: .leading) {
                Text(room.name)
                Text("\(room.capacity) people")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
