//
//  AnimalDetail.swift
//  SwiftUI-ListDemo
//
//  Created by Russell Archer on 23/06/2019.
//  Copyright © 2019 Russell Archer. All rights reserved.
//
// Updated for Xcode 11 Beta 5
//

import SwiftUI

struct AnimalDetail : View {
    let animal: Animal
    @State private var isZoomed = false
    
    var body: some View {
        VStack {
            Image(animal.imageName)
                .resizable()  // Images are fixed-size by default
                .aspectRatio(contentMode: isZoomed ? .fill : .fit)
                .cornerRadius(10)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .onTapGesture {
                    withAnimation { self.isZoomed.toggle() }
                }

            Text(animal.name)
            Text(animal.description)
                .foregroundColor(.gray)
        }
        .navigationBarTitle(Text("\(animal.name) Details"), displayMode: .inline)
    }
}

#if DEBUG
struct AnimalDetail_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            AnimalDetail(animal: Animal(name: "Owl", description: "Hoots"))
        }
    }
}
#endif
