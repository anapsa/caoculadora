//
//  ContentView.swift
//  caoculadora
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var years: Int? = nil;
    @State var months: Int? = nil
    var body: some View {
        VStack (alignment: .leading){
            Text("Qual a idade do seu cão?")
            Text("Anos")
            TextField("Digite a idade do seu cão tem", value: $years, format: .number)
            Text("Meses")
            TextField("Digite quantos meses seu cão tem", value: $months, format: .number)
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
