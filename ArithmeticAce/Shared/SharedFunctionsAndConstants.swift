//
//  SharedFunctionsAndConstants.swift
//  ArithmeticAce
//
//  Created by Joyce Tao on 2022-02-28.
//

import Foundation

func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

let savedAdditionEquationsLabel = "savedAdditionEquations"
let savedSubtractionEquationsLabel = "savedSubtractionEquations"
let savedMultiplicationEquationsLabel = "savedMultiplicationEquations"
let savedDivisionEquationsLabel = "savedDivisionEquations"
