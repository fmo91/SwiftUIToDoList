//
//  ToDoListScreen.swift
//  SUIToDo
//
//  Created by Fernando Martín Ortiz on 11/10/2020.
//

import SwiftUI

struct ToDoListScreen: View {
    @StateObject var viewModel = ToDoListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.toDos) { toDo in
                ToDoView(
                    viewModel: ToDoViewModel(
                        toDo: toDo,
                        onStateChange: { isOn in
                            self.viewModel.update(
                                toDo: toDo,
                                isOn: isOn
                            )
                        }
                    )
                )
            }
            .onDelete(perform: viewModel.delete)
        }
        .onAppear(perform: viewModel.load)
        .navigationTitle("To Do")
        .navigationBarItems(
            trailing: NavigationLink(
                "Add",
                destination: CreateToDoScreen()
            )
        )
    }
}

struct ToDoListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListScreen()
    }
}
