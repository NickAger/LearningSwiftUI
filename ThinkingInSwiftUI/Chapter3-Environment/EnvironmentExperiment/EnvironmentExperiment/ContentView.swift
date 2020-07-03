//
//  ContentView.swift
//  EnvironmentExperiment
//
//  Created by Nick Ager on 16/06/2020.
//  Copyright © 2020 Nick Ager. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .transformEnvironment(\.self) { dump($0) }
        }.font(Font.headline)/*.debug()*/
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func debug() -> Self {
         print(Mirror(reflecting:self).subjectType)
//        print(type(of: self))
        return self
    }
}
