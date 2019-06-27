//
//  ContentView.swift
//  SwiftUI-ListDemo
//
//  Created by Russell Archer on 21/06/2019.
//  Copyright © 2019 Russell Archer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // Declare animalStore to be a dynamic property that auto-subscribes
    // to our data model. Ensures that when our data model changes the
    // View is invalidated and re-rendered
    @ObjectBinding var animalStore: AnimalRepository
    
    var body: some View {
        NavigationView {
            List(animalStore.animals) { animal in
                AnimalCell(animal: animal)
            }
                
            .navigationBarTitle(Text("Animals"))
                
            // Add a "+" button to the nav bar to allow us
            // to test adding data to our model
            .navigationBarItems(
                trailing: Button(action: {
                    self.animalStore.animals.append(
                        Animal(name: "Owl", description: "Test!"))
                }, label: { Image(systemName: "plus") }))
        }
    }
}

struct AnimalCell: View {
    let animal: Animal
    
    var body: some View {
        return NavigationButton(destination: AnimalDetail(animal: animal)) {
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
        ContentView(animalStore: AnimalRepository())
    }
}
#endif

