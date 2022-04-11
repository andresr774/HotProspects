//
//  Prospect.swift
//  HotProspects
//
//  Created by Andres camilo Raigoza misas on 9/04/22.
//

import SwiftUI

let saveKey = "SavedData"

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var date = Date()
    fileprivate(set) var isContacted = false
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    let savePath = FileManager.documentsDirectory.appendingPathComponent(saveKey)
    
    init() {
//        if let data = UserDefaults.standard.data(forKey: saveKey) {
//            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
//                people = decoded
//                return
//            }
//        }
        do {
            let data = try Data(contentsOf: savePath)
            people = try JSONDecoder().decode([Prospect].self, from: data)
        } catch {
            print("[😀] Error getting data from url: \(error.localizedDescription)")
            // No saved data!
            people = []
        }
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            //UserDefaults.standard.set(encoded, forKey: saveKey)
            do {
                try encoded.write(to: savePath)
            } catch {
                print("Error saving to FileManager: \(error.localizedDescription)")
            }
        }
    }
    
    func addProspect(_ prospect: Prospect) {
        withAnimation {
            people.append(prospect)
        }
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
}
