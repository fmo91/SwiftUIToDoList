//
//  UpdateToDoRequest.swift
//  SUIToDo
//
//  Created by Fernando Martín Ortiz on 12/10/2020.
//

import Foundation

struct UpdateToDoRequest: RequestType {
    struct Content: Codable {
        let title: String
        let completed: Bool
        
        init(title: String, completed: Bool = false) {
            self.title = title
            self.completed = completed
        }
    }
    
    typealias ResponseType = EmptyResponse
    
    let id: String
    let content: Content
    
    var data: RequestData {
        return RequestData(
            path: "http://localhost:8080/todos/\(id)",
            method: .put,
            params: JSONFactory<Content>(object: content).buildJSON(),
            headers: [
                "Content-Type": "application/json"
            ]
        )
    }
}

