//
//  AnimalRepository.swift
//  SwiftUI-ListDemo
//
//  Created by Russell Archer on 25/06/2019.
//  Copyright © 2019 Russell Archer. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class AnimalRepository: BindableObject {
    // This allows us to publish a “change" message to subscribers
    var didChange = PassthroughSubject<Void, Never>()
    
    var animals: [Animal] = [] {
        didSet {
            // Called when the array is modified
            didChange.send()  // Let subscribers know we've changed
        }
    }
    
    init() {
        // Create initial test data
        animals.append(Animal(name: "Eagle", description: "Flys"))
        animals.append(Animal(name: "Owl", description: "Hoots"))
        animals.append(Animal(name: "Parrot", description: "Talks"))
        animals.append(Animal(name: "Penguin", description: "Waddles"))
        animals.append(Animal(name: "Zebra", description: "Runs"))
    }
}

