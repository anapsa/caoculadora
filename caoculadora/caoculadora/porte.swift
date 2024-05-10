//
//  porte.swift
//  caoculadora
//
//  Created by Ana Paula Sá Barreto Paiva da Cunha on 10/05/24.
//

import Foundation

enum porte: String, CaseIterable{
    case pequeno = "Pequeno"
    case medio = "Médio"
    case grande = "Grande"
    
    func conversaoIdade(anos: Int, meses: Int) -> Int {
        let result: Int
        let mul: Int
        switch self{
        case .pequeno:
            mul = 6
        case .medio:
            mul = 7
        case .grande:
            mul = 8
        }
        result = anos*mul + (meses*mul/12)
        return result
    }
}
