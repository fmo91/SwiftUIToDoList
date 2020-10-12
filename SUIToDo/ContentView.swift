//
//  ContentView.swift
//  SUIToDo
//
//  Created by Fernando Martín Ortiz on 11/10/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ToDoListScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
