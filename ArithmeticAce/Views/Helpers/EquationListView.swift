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
            
            Text("(\(inputAnswer))")
                .opacity(status == false ? 1.0 : 0.0)
            
            Spacer()
            
            ZStack {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
                    .opacity(status == true ? 1.0 : 0.0)
                
                Image(systemName: "xmark.circle")
                    .foregroundColor(.red)
                    .opacity(status == false ? 1.0 : 0.0)
            }
        }
    }
}

struct EquationListView_Previews: PreviewProvider {
    static var previews: some View {
        EquationListView(equation: "50 ÷ 5 = 10", inputAnswer: "8", status: false)
    }
}
