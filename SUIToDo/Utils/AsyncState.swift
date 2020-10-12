//
//  AsyncState.swift
//  SUIToDo
//
//  Created by Fernando Martín Ortiz on 12/10/2020.
//

import Foundation

enum AsyncState<T> {
    case idle
    case loading
    case succeed(T)
    case failed(Error)
}
