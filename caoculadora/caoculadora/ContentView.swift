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
    @State var porteSelecionado: porte = .pequeno
    var body: some View {
        VStack (alignment: .leading){
            Text("Qual a idade do seu cão?")
                .font(.header5)
            Text("Anos")
                .font(.body1)
            TextField("Digite a idade do seu cão tem", value: $years, format: .number)
            Text("Meses")
                .font(.body1)
            TextField("Digite quantos meses seu cão tem", value: $months, format: .number)
            Text("Porte")
                .font(.body1)
            Picker("Porte", selection: $porteSelecionado){
                ForEach(porte.allCases, id: \.self) { porte in
                    Text(porte.rawValue)
                        .tag(porte)
                }
            }
            .pickerStyle(.segmented)
            Divider()
            Spacer()
            if let result {
                Text("A idade do seu cachorro em anos humanos é")
                    .font(.body1)
                Text("\(result) anos")
                    .font(.display)
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
                            .font(.body1)
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
        result = porteSelecionado.conversaoIdade(
            anos: years,
            meses: months
        )
    }
}

#Preview {
    ContentView()
}
