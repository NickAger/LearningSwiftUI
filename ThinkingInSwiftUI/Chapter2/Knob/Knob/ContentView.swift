//
//  ContentView.swift
//  Knob
//
//  Created by Nick Ager on 12/06/2020.
//  Copyright © 2020 Nick Ager. All rights reserved.
//

import SwiftUI

struct KnobShape: Shape {
    var pointerSize: CGFloat = 0.1 // these are relative values
    var pointerWidth: CGFloat = 0.1
    func path(in rect: CGRect) -> Path {
        let pointerHeight = rect.height * pointerSize
        let pointerWidth = rect.width * self.pointerWidth
        let circleRect = rect.insetBy(dx: pointerHeight, dy: pointerHeight)
        return Path { p in
            p.addEllipse(in: circleRect)
            p.addRect(CGRect(x: rect.midX - pointerWidth/2, y: 0, width: pointerWidth, height: pointerHeight + 2))
        }
    }
}

struct Knob: View {
    // should be between 0 and 1
    @Binding var value: Double
    var body: some View {
        KnobShape()
        .fill(Color.gray)
        .rotationEffect(Angle(degrees: value * 330))
        .onTapGesture {
            self.value = self.value < 0.5 ? 0 : 1
        }
    }
}

struct ContentView: View {
    @State var volume:Double = 0.5
    
    var body: some View {
        VStack {
            Knob(value: $volume)
                .frame(width: 100, height: 100)
            Slider(value:$volume, in:(0...1))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
