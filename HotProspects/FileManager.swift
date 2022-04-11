//
//  FileManager.swift
//  HotProspects
//
//  Created by Andres camilo Raigoza misas on 10/04/22.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
