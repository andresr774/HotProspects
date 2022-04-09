//
//  ContextMenuExplanation.swift
//  HotProspects
//
//  Created by Andres camilo Raigoza misas on 8/04/22.
//

import SwiftUI

struct ContextMenuExplanation: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding()
                .background(backgroundColor)
            
            Text("Change Color")
                .padding()
                .contextMenu {
                    Button("Red") {
                        backgroundColor = .red
                    }
                    Button("Green") {
                        backgroundColor = .green
                    }
                    Button("Blue") {
                        backgroundColor = .blue
                    }
                }
        }
    }
}

struct ContextMenuExplanation_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuExplanation()
    }
}
