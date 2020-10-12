//
//  ToDo.swift
//  SUIToDo
//
//  Created by Fernando Martín Ortiz on 11/10/2020.
//

import Foundation

struct ToDo: Codable, Identifiable {
    let id: String
    let title: String
    var completed: Bool
}
