//
//  ToDoListViewModel.swift
//  SUIToDo
//
//  Created by Fernando Martín Ortiz on 12/10/2020.
//

import Combine
import SwiftUI

class ToDoListViewModel: ObservableObject {
    @Published private(set) var toDos = [ToDo]()
    
    private var cancellables = Set<AnyCancellable>()
    
    func load() {
        toDos = []
        GetToDosRequest()
            .execute()
            .replaceError(with: [ToDo]())
            .assign(to: \.toDos, on: self)
            .store(in: &cancellables)
    }
    
    func delete(at indexSet: IndexSet) {
        guard let index = indexSet.first else {
            return
        }
        
        DeleteToDoRequest(id: toDos[index].id)
            .execute()
            .sink(receiveCompletion: {_ in}, receiveValue: {_ in})
            .store(in: &cancellables)
        
        toDos.remove(at: index)
    }
    
    func update(toDo: ToDo, isOn: Bool) {
        UpdateToDoRequest
            .init(
                id: toDo.id,
                content: UpdateToDoRequest.Content(
                    title: toDo.title,
                    completed: isOn
                )
            )
            .execute()
            .sink(receiveCompletion: {_ in}, receiveValue: {_ in})
            .store(in: &cancellables)
        
        if let index = toDos.firstIndex(where: { $0.id == toDo.id }) {
            toDos[index].completed = isOn
        }
    }
}
