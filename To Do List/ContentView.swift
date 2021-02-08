//
//  ContentView.swift
//  To Do List
//
//  Created by kevin rosas on 2/8/21.
//  Copyright © 2021 kevin rosas. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var things = ["First Thing", "Second Thing", "Third Thing", "Fourth Thing", "Fifth Thing"]
    
    var body: some View {
        NavigationView{
            List{
                ForEach(things, id: \.self) {thing in
                    Text(thing)
                }
                .onMove { (indices, newOffset) in
                    self.things.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete { (indexSet) in
                    self.things.remove(atOffsets: indexSet)                }
            }
            .navigationBarTitle("Things")
            .navigationBarItems(leading: EditButton())
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

