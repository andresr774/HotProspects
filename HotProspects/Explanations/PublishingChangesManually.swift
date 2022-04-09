//
//  PublishingChangesManually.swift
//  HotProspects
//
//  Created by Andres camilo Raigoza misas on 8/04/22.
//

import SwiftUI

@MainActor class DelayedUpdater: ObservableObject {
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct PublishingChangesManually: View {
    @StateObject private var updater = DelayedUpdater()
    
    var body: some View {
        Text("Value is \(updater.value)")
    }
}

struct PublishingChangesManually_Previews: PreviewProvider {
    static var previews: some View {
        PublishingChangesManually()
    }
}
