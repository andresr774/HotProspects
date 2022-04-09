//
//  EnvironmentObjectExplanation.swift
//  HotProspects
//
//  Created by Andres camilo Raigoza misas on 8/04/22.
//

import SwiftUI

@MainActor class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

struct EnvironmentObjectExplanation: View {
    @StateObject var user = User()
    
    var body: some View {
        VStack {
            EditView()
            DisplayView()
        }
        .environmentObject(user)
    }
}

struct EnvironmentObjectExplanation_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectExplanation()
    }
}
