//
//  DeleteToDoRequest.swift
//  SUIToDo
//
//  Created by Fernando Martín Ortiz on 12/10/2020.
//

import Foundation

struct DeleteToDoRequest: RequestType {
    typealias ResponseType = EmptyResponse
    
    let id: String
    
    var data: RequestData {
        return RequestData(
            path: "http://localhost:8080/todos/\(id)",
            method: .delete
        )
    }
}
