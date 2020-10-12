//
//  CreateToDoScreen.swift
//  SUIToDo
//
//  Created by Fernando Martín Ortiz on 11/10/2020.
//

import SwiftUI

struct CreateToDoScreen: View {
    @StateObject var viewModel = CreateToDoViewModel()
    @Environment(\.presentationMode) var presentation: Binding<PresentationMode>
    
    var body: some View {
        List {
            TextField("Title", text: $viewModel.title)
            Toggle("Completed", isOn: $viewModel.completed)
        }
        .navigationTitle("Create To Do")
        .navigationBarItems(trailing: Button("Save") {
            viewModel.save(presentation: presentation)
        })
    }
}

struct CreateToDoScreen_Previews: PreviewProvider {
    static var previews: some View {
        CreateToDoScreen()
    }
}
