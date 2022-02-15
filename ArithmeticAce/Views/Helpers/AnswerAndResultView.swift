//
//  AnswerAndResultView.swift
//  ArithmeticAce
//
//  Created by Joyce Tao on 2022-02-15.
//

import SwiftUI

struct AnswerAndResultView: View {
    
    // MARK: Stored properties
    // These properties are NOT modified on the helper view
    // So, we can declare them as regular constants "let"
    let answerCorrect: Bool
    let answerChecked: Bool
    
    // This property IS modified (by the TextField) in this helper view AND we want to send its value back to the source of truth on the originating view
    @Binding var inputGiven: String
    
    // MARK: Computed properties
    var body: some View {
        HStack {
            ZStack {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
                    //        CONDITION      true  false
                    .opacity(answerCorrect ? 1.0 : 0.0)
                
                Image(systemName: "xmark.circle")
                    .foregroundColor(.red)
                    .opacity(answerCorrect == false && answerChecked == true ? 1.0 : 0.0)
            }
            Spacer()
            TextField("",
                      text: $inputGiven)
                .multilineTextAlignment(.trailing)
        }
    }
}

