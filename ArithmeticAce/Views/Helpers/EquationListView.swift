//
//  EquationListView.swift
//  ArithmeticAce
//
//  Created by Joyce Tao on 2022-02-26.
//

import SwiftUI

struct EquationListView: View {
    let equation: String
    let inputAnswer: String
    let status: Bool
    
    var body: some View {
        HStack {
            Text(equation)
            
            if status == true {
                Spacer()
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
            } else if status == false {
                Text("(\(inputAnswer))")
                Spacer()
                Image(systemName: "xmark.square")
                    .foregroundColor(.red)
            }
        }
    }
}

struct EquationListView_Previews: PreviewProvider {
    static var previews: some View {
        EquationListView(equation: "50 ÷ 5 = 10", inputAnswer: "8", status: false)
    }
}
