//
//Equations.swift
//  ArithmeticAce
//
//  Created by Joyce Tao on 2022-02-27.
//

import Foundation

struct Equation: Hashable, Decodable, Encodable {
    let id = UUID()
    let fullEquation: String
    let givenAnswer: String
    let wasCorrect: Bool
}
