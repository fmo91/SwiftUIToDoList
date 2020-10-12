//
//  CreateToDoRequest.swift
//  SUIToDo
//
//  Created by Fernando Martín Ortiz on 12/10/2020.
//

import Foundation

struct CreateToDoRequest: RequestType {
    struct Content: Codable {
        let title: String
        let completed: Bool
        
        init(title: String, completed: Bool = false) {
            self.title = title
            self.completed = completed
        }
    }
    
    typealias ResponseType = ToDo
    
    let content: Content
    
    var data: RequestData {
        return RequestData(
            path: "http://localhost:8080/todos",
            method: .post,
            params: JSONFactory<Content>(object: content).buildJSON(),
            headers: [
                "Content-Type": "application/json"
            ]
        )
    }
}

