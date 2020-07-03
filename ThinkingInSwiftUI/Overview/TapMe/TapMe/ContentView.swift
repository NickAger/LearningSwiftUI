//
//  ContentView.swift
//  TapMe
//
//  Created by Nick Ager on 09/06/2020.
//  Copyright © 2020 Nick Ager. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0
    var another = 0
    var body: some View {
        VStack {
            Button(action: {
                self.tapCount += 1
                // self.another += 1 // Left side of mutating operator isn't mutable: 'self' is immutable
                print(type(of: self.body))
            }) {
                Text("Tap me!")
                    .padding()
                    .background(Color(.tertiarySystemFill))
                    .cornerRadius(10)
            }
            if tapCount == 0 {
                Text("You've not yet tapped")
                    
            } else {
                Text("You've tapped \(tapCount) times")
            }
        }.border(Color.black, width: 1).frame(width: 200, height: 200).border(Color(.tertiaryLabel), width: 1).debug()
    }
}

extension View {
    func debug() -> Self {
        // print(Mirror(reflecting:self).subjectType)
        print(type(of: self))
        return self
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
