//
//  MultiplicationView.swift
//  ArithmeticAce
//
//  Created by Russell Gordon on 2022-02-07.
//

import SwiftUI

struct MultiplicationView: View {
    
    // MARK: Stored properties
    @State var multiplicand = Int.random(in: 1...12)
    @State var multiplier = Int.random(in: 1...12)
    @State var inputGiven = ""
    
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    @State var equationList: [Equation] = []
    
    // MARK: Computed properties
    // What is the correct product?
    var correctProduct: Int {
        return multiplicand * multiplier
    }
    
    var completeEquation: String {
        return "\(multiplicand) 𐄂 \(multiplier) = \(correctProduct)"
    }
    
    var body: some View {
                
        VStack(spacing: 0) {
            QuestionPresentationView(operation: "✕", firstValue: multiplicand, secondValue: multiplier)
            
            Divider()
            AnswerAndResultView(answerCorrect: answerCorrect, answerChecked: answerChecked, inputGiven: $inputGiven)
            
            ZStack {
                CheckAnswerView(answerChecked: $answerChecked, answerCorrect: $answerCorrect, correctAnswer: correctProduct, inputGiven: inputGiven, completeEquation: completeEquation, equationList: $equationList)
                
                Button(action: {
                    
                    // Generate new numbers
                    multiplicand = Int.random(in: 1...12)
                    multiplier = Int.random(in: 1...12)
                    
                    // Reset properties that we are using to keep track of whether a question has been answered and whether the answer is correct
                    answerChecked = false
                    answerCorrect = false
                    
                    // Reset the field where the user gives an answer
                    inputGiven = ""
                    
                }, label: {
                    Text("New Question")
                        .font(.largeTitle)
                })
                    .padding()
                    .buttonStyle(.bordered)
                    .opacity(answerChecked ? 1.0 : 0.0)
            }
            
            //ReactionAnimationView(happyReactionName: "9891-happy-donut", sadReactionName: "84655-swinging-sad-emoji", answerCorrect: answerCorrect, answerChecked: answerChecked)

            List(equationList, id: \.self) { oneEquation in
                EquationListView(equation: oneEquation.fullEquation, inputAnswer: oneEquation.givenAnswer, status: oneEquation.wasCorrect)
            }
            .font(.system(size: 25))
            
            Spacer()
        }
        .padding(.horizontal)
        .font(.system(size: 72))
    }
}

struct MultiplicationView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplicationView()
    }
}
