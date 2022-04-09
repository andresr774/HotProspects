//
//  ResultTypeExplanation.swift
//  HotProspects
//
//  Created by Andres camilo Raigoza misas on 8/04/22.
//

import SwiftUI

struct ResultTypeExplanation: View {
    @State private var output = ""
    
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    
    func fetchReadings() async {
        let fetchTask = Task { () -> String in
            let url = URL(string: "https://hws.dev/readings.json")!
            
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings."
        }
        
        let result = await fetchTask.result
        
        // First alternative
//        do {
//            output = try result.get()
//        } catch {
//            print("Download error")
//        }
        
        // Second alternative
        switch result {
        case .success(let str):
            output = str
        case .failure(let error):
            output = "Download error \(error.localizedDescription)"
        }
    }
}

struct ResultTypeExplanation_Previews: PreviewProvider {
    static var previews: some View {
        ResultTypeExplanation()
    }
}
