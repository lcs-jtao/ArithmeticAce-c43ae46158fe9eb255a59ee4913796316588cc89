//
//  CheckAnswerView.swift
//  ArithmeticAce
//
//  Created by Joyce Tao on 2022-02-15.
//

import SwiftUI

struct CheckAnswerView: View {
    
    // MARK: Stored properties
    @Binding var answerChecked: Bool
    @Binding var answerCorrect: Bool
    let correctAnswer: Int
    let inputGiven: String
    let completeEquation: String
    @Binding var equationList: Array<Equation>

    // MARK: Computed properties
    var body: some View {
        Button(action: {
            
            // Answer has been checked!
            answerChecked = true
            
            // Convert the input given to an integer, if possible
            guard let answerGiven = Int(inputGiven) else {
                // Sadness, not a number
                answerCorrect = false
                return
            }

            // Check the answer!
            if answerGiven == correctAnswer {
                // Celebrate! 👍🏼
                answerCorrect = true
            } else {
                // Sadness, they gave a number, but it's not correct 😭
                answerCorrect = false
            }
            
            equationList.append(Equation(fullEquation: completeEquation, givenAnswer: inputGiven, wasCorrect: answerCorrect))

        }, label: {
            Text("Check Answer")
                .font(.largeTitle)
        })
            .padding()
            .buttonStyle(.bordered)
            .opacity(answerChecked ? 0.0 : 1.0)
    }
}
