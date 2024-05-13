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
    @State var failedInput = false
    let tituloPreencherCampos = "Preencha os campos para pode cãocular!"
    @State var zeroInput = false
    let tituloCamposZero = "Pelo menos um dos campos tem que ser diferente de zero"
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack (alignment: .leading, spacing: 20){
                    Text("Qual a idade do seu cão?")
                        .font(.header5)
                        .padding(.top, 24)
                    VStack (alignment: .leading, spacing: 8.0) {
                        Text("Anos")
                            .font(.body1)
                        TextField("Digite a idade do seu cão tem", value: $years, format: .number)
                    }
                    VStack (alignment: .leading, spacing: 8.0) {
                        Text("Meses")
                            .font(.body1)
                        TextField("Digite quantos meses seu cão tem", value: $months, format: .number)
                    }
                    VStack (alignment: .leading, spacing: 8.0) {
                        Text("Porte")
                            .font(.body1)
                        Picker("Porte", selection: $porteSelecionado){
                            ForEach(porte.allCases, id: \.self) { porte in
                                Text(porte.rawValue)
                                    .tag(porte)
                            }
                        }
                    }
                    .pickerStyle(.segmented)
                    Divider()
                    Spacer()
                    if let result {
                        Text("A idade do seu cachorro em anos humanos é")
                            .font(.body1)
                            .frame(maxWidth:.infinity)
                        Text("\(result) anos")
                            .contentTransition(.numericText())
                            .font(.display)
                            .frame(maxWidth:.infinity)
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
                            Color.indigo500
                            Text("Cãocular")
                                .foregroundStyle(.white)
                                .font(.body1)
                        }
                        .cornerRadius(10)
                    }
                    )
                    .frame(height: 50)
                }
                .padding()
                .containerRelativeFrame(.vertical)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .bold()
                .fontDesign(.rounded)
                .padding()
                .navigationTitle("Cãoculadora")
                .toolbarBackground(.visible, for: .navigationBar)
                .toolbarBackground(.indigo500, for: .navigationBar)
                .toolbarColorScheme(.dark, for: .navigationBar)
            }
            .alert(tituloPreencherCampos, isPresented: $failedInput){
                Button("Ok", role: .cancel, action: {})
            }
            .alert(tituloCamposZero, isPresented: $zeroInput){
                Button("Ok", role: .cancel, action: {})
            }
        }
        .scrollDismissesKeyboard(.immediately)
    }
    func processYears(){
        
        guard
            let years, let months
        else {
            print("preencha o campo de entrada")
            failedInput = true
            return
        }
        guard years != 0 || months != 0
        else {
            zeroInput = true
            return
        }
        withAnimation(.easeIn.speed(0.5)) {
            result = porteSelecionado.conversaoIdade(
                anos: years,
                meses: months
            )
        }
    }
}

#Preview {
    ContentView()
}
