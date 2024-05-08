//
//  ContentView.swift
//  caoculadora
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var years: Int? = nil
    @State var months: Int? = nil
    @State var result: Int? = nil
    
    var body: some View {
        
        VStack (alignment: .leading){
            Text("Qual a idade do seu cão?")
            Text("Anos")
            TextField("Digite a idade do seu cão tem", value: $years, format: .number)
            Text("Meses")
            TextField("Digite quantos meses seu cão tem", value: $months, format: .number)
            Text("Porte")
            if let result {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            } else {
                Image(ImageResource.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: .infinity)
                .shadow(radius: 20)
            }
            Button(action: {
                result = 23
            },
                   label: {
                    ZStack{
                        Color.yellow
                        Text("Cãocular")
                            .foregroundStyle(.white)
                    
                    }
                    .cornerRadius(10)
                }
            )
            .frame(maxHeight: 50)
            
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .bold()
        .fontDesign(.rounded)
        
    }
}

#Preview {
    ContentView()
}
