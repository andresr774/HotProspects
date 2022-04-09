//
//  SwiftPackageDependencies.swift
//  HotProspects
//
//  Created by Andres camilo Raigoza misas on 8/04/22.
//

import SwiftUI
import SamplePackage

struct SwiftPackageDependencies: View {
    let possibleNumbers = Array(1...60)
    
    
    var body: some View {
        Text(results)
    }
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
}

struct SwiftPackageDependencies_Previews: PreviewProvider {
    static var previews: some View {
        SwiftPackageDependencies()
    }
}
