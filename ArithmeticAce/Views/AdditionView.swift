//
//  AdditionView.swift
//  ArithmeticAce
//
//  Created by Joyce Tao on 2022-02-11.
//

import SwiftUI

struct AdditionView: View {
    // MARK: Stored properties
    @State var augend = Int.random(in: 1...144)
    @State var addend = 0
    @State var inputGiven = ""
    
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    @State var equationList: [Equation] = []
    
    // MARK: Computed properties
    // What is the correct sum?
    var correctSum: Int {
        return augend + addend
    }
    
    var completeEquation: String {
        return "\(augend) + \(addend) = \(correctSum)"
    }
    
    var body: some View {
                
        VStack(spacing: 0) {
            QuestionPresentationView(operation: "+", firstValue: augend, secondValue: addend)
            
            Divider()
            
            AnswerAndResultView(answerCorrect: answerCorrect, answerChecked: answerChecked, inputGiven: $inputGiven)
            
            ZStack {
                CheckAnswerView(answerChecked: $answerChecked, answerCorrect: $answerCorrect, correctAnswer: correctSum, inputGiven: inputGiven, completeEquation: completeEquation, equationList: $equationList)
                
                Button(action: {
                    
                    // Generate new numbers
                    augend = Int.random(in: 1...144)
                    addend = Int.random(in: 1...144-augend)
                    
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
        
        .task {
            addend = Int.random(in: 1...144-augend)
        }
    }
}

struct AdditionView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionView()
    }
}
