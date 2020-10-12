//
//  Codable+JSON.swift
//  SUIToDo
//
//  Created by Fernando Martín Ortiz on 12/10/2020.
//

import Foundation

struct JSONFactory<T: Codable> {
    private let object: T
    
    init(object: T) {
        self.object = object
    }
    
    func buildJSON() -> [String: Any?]? {
        let encoder = JSONEncoder()
        guard let objectData = try? encoder.encode(object) else {
            return nil
        }
        let objectJSON = try? JSONSerialization
            .jsonObject(with: objectData, options: [])
        return objectJSON as? [String: Any?]
    }
}
