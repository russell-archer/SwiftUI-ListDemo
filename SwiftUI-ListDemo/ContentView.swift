//
//  ContentView.swift
//  SwiftUI-ListDemo
//
//  Created by Russell Archer on 21/06/2019.
//  Copyright © 2019 Russell Archer. All rights reserved.
//
// Tested and working with Xcode 11 Beta 7 on Mojave 10.14.6
//

import SwiftUI

struct ContentView: View {
    // animalStore is a dynamic property that auto-subscribes to our data model.
    // When our data model changes the View is invalidated and re-rendered
    @ObservedObject var animalStore: AnimalRepository
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    // Add a button to the list itself
                    Button(action: addAnimal) {
                        Text("Add Animal")
                    }
                }

                Section {
                    // Use the SwiftUI ForEach (i.e. NOT the Swift forEach)
                    // to add data to the list
                    ForEach(animalStore.animals) { animal in
                        AnimalCell(animal: animal)
                    }
                    .onDelete(perform: deleteAnimals)  // Swipe left to delete
                }
            }

            .navigationBarTitle(Text("Animals"))
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func addAnimal() {
        animalStore.animals.append(Animal(name: "Owl", description: "Test!"))
    }
    
    func deleteAnimals(at offsets: IndexSet) {
        offsets.forEach { index in
            animalStore.animals.remove(at: index)
        }
    }
}

struct AnimalCell: View {
    let animal: Animal
    
    var body: some View {
        NavigationLink(destination: AnimalDetail(animal: animal)) {
            Image(animal.thumbName)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(animal.name)
                Text(animal.description)
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(animalStore: AnimalRepository())
            
            // Show a second preview with dark mode enabled
            ContentView(animalStore: AnimalRepository())
                .environment(\.colorScheme, .dark)
        }
    }
}
#endif

