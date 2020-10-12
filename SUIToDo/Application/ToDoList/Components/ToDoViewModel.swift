//
//  ToDoViewModel.swift
//  SUIToDo
//
//  Created by Fernando Martín Ortiz on 12/10/2020.
//

import Combine

final class ToDoViewModel: ObservableObject {
    @Published var isOn: Bool
    var title: String {
        toDo.title
    }
    private let toDo: ToDo
    private var cancellables = Set<AnyCancellable>()
    
    init(toDo: ToDo, onStateChange: @escaping (Bool) -> Void) {
        self.toDo = toDo
        self.isOn = toDo.completed
        $isOn
            .sink { (isOn: Bool) in
                onStateChange(isOn)
            }
            .store(in: &cancellables)
    }
}
