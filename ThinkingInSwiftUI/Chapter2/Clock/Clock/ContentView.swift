//
//  ContentView.swift
//  Clock
//
//  Created by Nick Ager on 12/06/2020.
//  Copyright © 2020 Nick Ager. All rights reserved.
//

import SwiftUI

final class CurrentTime: ObservableObject {
    @Published var now: Date = Date()
    let interval: TimeInterval = 1
    private var timer: Timer? = nil
    
    func start() {
        guard timer == nil else {return}
        now = Date()
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] _ in
            self?.now = Date()
        }
    }
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    deinit {
        stop()
    }
}

struct TimerView: View {
    @ObservedObject var date = CurrentTime()
    var blah: Int = {
        print("TimerView created")
        return 5
    }()
    
    var body: some View {
        print("Timer view")
        
        return Text("\(date.now)")
            .onAppear { self.date.start()}
            .onDisappear {self.date.stop()}
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: TimerView()) {
                Text("Go to timer")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
