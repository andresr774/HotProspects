//
//  SwipeActionsToList.swift
//  HotProspects
//
//  Created by Andres camilo Raigoza misas on 8/04/22.
//

import SwiftUI

struct SwipeActionsToList: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button(role: .destructive) {
                        print("Deleting")
                    } label: {
                        Label("Delete", systemImage: "minus.circle")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button {
                        print("pinning")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
        }
    }
}

struct SwipeActionsToList_Previews: PreviewProvider {
    static var previews: some View {
        SwipeActionsToList()
    }
}
