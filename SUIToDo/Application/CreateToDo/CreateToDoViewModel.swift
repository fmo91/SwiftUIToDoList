//
//  CreateToDoViewModel.swift
//  SUIToDo
//
//  Created by Fernando Martín Ortiz on 12/10/2020.
//

import SwiftUI
import Combine

final class CreateToDoViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var completed: Bool = false
    var presentation: Binding<PresentationMode>?
    
    private var cancellables = [AnyCancellable]()
    
    func save(presentation: Binding<PresentationMode>) {
        guard !title.isEmpty else {
            return
        }
        
        CreateToDoRequest
            .init(
                content: CreateToDoRequest.Content(
                    title: title,
                    completed: completed
                )
            )
            .execute()
            .sink(
                receiveCompletion: { _ in
                    presentation.wrappedValue.dismiss()
                },
                receiveValue: { _ in }
            )
            .store(in: &cancellables)
    }
}
