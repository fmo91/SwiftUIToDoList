//
//  SwiftUIWireframe.swift
//  SUIToDo
//
//  Created by Fernando Martín Ortiz on 12/10/2020.
//

import Foundation
import Combine
import SwiftUI

protocol SwiftUIWireframe: ObservableObject {
    var states: [NavigationControls<Self>.StateSeed] { get }
}

extension SwiftUIWireframe {
    var navigationControls: some View {
        NavigationControls(
            from: self,
            states: states
        )
    }
}

struct NavigationControls<T: ObservableObject>: View {
    typealias Base = ObservedObject<T>.Wrapper
    typealias StateSeedCreator = () -> StateSeed
    struct StateSeed {
        let property: KeyPath<Base, Binding<Bool>>
        let destination: AnyView
        
        static func using(
            property: KeyPath<Base, Binding<Bool>>,
            destination: AnyView
        ) -> StateSeed {
            return StateSeed(property: property, destination: destination)
        }
    }
    
    @ObservedObject var wireframe: T
    private let stateSeeds: [StateSeed]
    
    init(from wireframe: T, states stateSeeds: [StateSeed]) {
        self.wireframe = wireframe
        self.stateSeeds = stateSeeds
    }

    var body: some View {
        NavigationControlsRenderer<T>(navigationStates: stateSeeds.map { state in
            return NavigationState(
                from: $wireframe,
                property: state.property,
                destination: state.destination
            )
        })
    }
}

struct NavigationControlsRenderer<T: ObservableObject>: View {
    let links: [Link]
    
    init(navigationStates: [NavigationState<T>]) {
        links = navigationStates.map { state in
            state.link
        }
    }
    
    var body: some View {
        ForEach(links) { link in
            NavigationLink(
                destination: link.destination,
                isActive: link.isActive,
                label: { EmptyView() }
            )
        }
    }
}

final class Link: Identifiable {
    let id: String
    var isActive: Binding<Bool>
    let destination: AnyView
    
    init(
        isActive: Binding<Bool>,
        destination: AnyView
    ) {
        self.id = UUID().uuidString
        self.isActive = isActive
        self.destination = destination
    }
}

struct NavigationState<T: ObservableObject> {
    typealias Base = ObservedObject<T>.Wrapper
    
    let base: Base
    let property: KeyPath<Base, Binding<Bool>>
    let destination: AnyView
    
    init(from base: Base, property: KeyPath<Base, Binding<Bool>>, destination: AnyView) {
        self.base = base
        self.property = property
        self.destination = destination
    }
    
    var link: Link {
        Link(
            isActive: base[keyPath: property],
            destination: destination
        )
    }
}
