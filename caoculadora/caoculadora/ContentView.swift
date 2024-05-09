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
    @State var porte: String = "pequeno"
    let portes = ["pequeno", "médio", "grande"]
    var body: some View {
        VStack (alignment: .leading){
       
            Text("Qual a idade do seu cão?")
            Text("Anos")
            TextField("Digite a idade do seu cão tem", value: $years, format: .number)
            Text("Meses")
            TextField("Digite quantos meses seu cão tem", value: $months, format: .number)
            Text("Porte")
            Picker("Porte", selection: $porte){
                ForEach(portes, id: \.self) { porte in
                    Text(porte)
                        .tag(porte)
                }
            }
            .pickerStyle(.segmented)
            Divider()
            Spacer()
            if let result {
                Text("A idade do seu cachorro em anos humanos é")
                Text("\(result) anos")
              
            } else {
                Image(ImageResource.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .frame(maxWidth: .infinity)
                .shadow(radius: 20)
            }
            Spacer()
            Button(action: processYears,
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
    func processYears(){
        guard 
            let years, let months
        else {
            print("preencha o campo de entrada")
            return
        }
        result = years*7 + (months*7/12)
    }
}

#Preview {
    ContentView()
}
