//
//  ToDoView.swift
//  SUIToDo
//
//  Created by Fernando Martín Ortiz on 12/10/2020.
//

import SwiftUI

struct ToDoView: View {
    @StateObject var viewModel: ToDoViewModel
    
    var body: some View {
        HStack {
            Toggle("", isOn: $viewModel.isOn)
                .labelsHidden()
            Text(viewModel.title)
            Spacer()
        }.padding()
    }
}
