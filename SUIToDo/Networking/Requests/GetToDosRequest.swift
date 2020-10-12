//
//  GetToDosRequest.swift
//  SUIToDo
//
//  Created by Fernando Martín Ortiz on 12/10/2020.
//

import Foundation

struct GetToDosRequest: RequestType {
    typealias ResponseType = [ToDo]
    
    var data: RequestData {
        return RequestData(
            path: "http://localhost:8080/todos",
            method: .get
        )
    }
}
