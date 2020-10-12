//
//  ToDoTests.swift
//  SUIToDoTests
//
//  Created by Fernando Martín Ortiz on 11/10/2020.
//

import XCTest
import Quick
import Nimble
@testable import SUIToDo

final class ToDoSpec: QuickSpec {
    override func spec() {
        describe("The ToDo model decoding") {
            var jsonData: Data!
            
            context("When the json is complete") {
                var items: [ToDo]!
                
                beforeSuite {
                    let json = [
                        [
                            "title": "Tarea 1",
                            "completed": true
                        ],
                        [
                            "title": "Tarea 2",
                            "completed": false
                        ],
                        [
                            "title": "Tarea 3",
                            "completed": true
                        ]
                    ]
                    
                    jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
                    items = try! JSONDecoder().decode([ToDo].self, from: jsonData)
                }
                
                it("Should have three items") {
                    expect(items.count).to(equal(3))
                }
                
                it("Should have a valid first to do") {
                    expect(items.first!.title).to(equal("Tarea 1"))
                    expect(items.first!.completed).to(beTrue())
                }
            }
            
            context("When the json is invalid") {
                var items: [ToDo]!
                
                beforeSuite {
                    let json = [
                        [
                            "title": "Tarea 1"
                        ],
                        [
                            "completed": false
                        ]
                    ]
                    
                    jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
                    items = (try? JSONDecoder().decode([ToDo].self, from: jsonData)) ?? []
                }
                
                it("Should not be able to get the to do items") {
                    expect(items.count).to(equal(0))
                }
            }
        }
    }
}
