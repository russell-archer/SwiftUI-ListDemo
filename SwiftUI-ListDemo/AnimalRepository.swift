//
//  AnimalRepository.swift
//  SwiftUI-ListDemo
//
//  Created by Russell Archer on 25/06/2019.
//  Copyright © 2019 Russell Archer. All rights reserved.
//
// Updated for Xcode 11 Beta 6
//

import Foundation
import SwiftUI
import Combine

class AnimalRepository: ObservableObject {
    @Published var animals = [Animal]()
    
    init() {
        // Create initial test data
        animals.append(Animal(name: "Eagle", description: "Flys"))
        animals.append(Animal(name: "Owl", description: "Hoots"))
        animals.append(Animal(name: "Parrot", description: "Talks"))
        animals.append(Animal(name: "Penguin", description: "Waddles"))
        animals.append(Animal(name: "Zebra", description: "Runs"))
    }
}

