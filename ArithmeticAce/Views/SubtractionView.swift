//
//  SubtractionView.swift
//  ArithmeticAce
//
//  Created by Joyce Tao on 2022-02-11.
//

import SwiftUI

struct SubtractionView: View {
    // MARK: Stored properties
    @State var minuend = Int.random(in: 1...144)
    @State var subtrahend = 0
    
    // This string contains whatever the user types in
    @State var inputGiven = ""
    
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    // MARK: Computed properties
    // What is the correct difference?
    var correctDifference: Int {
        return minuend - subtrahend
    }
    
    var body: some View {
                
        VStack(spacing: 0) {
            QuestionPresentationView(operation: "-", firstValue: minuend, secondValue: subtrahend)
            
            Divider()
            
            AnswerAndResultView(answerCorrect: answerCorrect, answerChecked: answerChecked, inputGiven: $inputGiven)
            
            ZStack {
                CheckAnswerView(answerChecked: $answerChecked, answerCorrect: $answerCorrect, correctAnswer: correctDifference, inputGiven: inputGiven)
                
                Button(action: {
                    
                    // Generate new numbers
                    minuend = Int.random(in: 1...144)
                    subtrahend = Int.random(in: 1...minuend)
                    
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
            
            ReactionAnimationView(happyReactionName: "9891-happy-donut", sadReactionName: "84655-swinging-sad-emoji", answerCorrect: answerCorrect, answerChecked: answerChecked)

            Spacer()
        }
        .padding(.horizontal)
        .font(.system(size: 72))
        // This code block (closure) runs once when the view is first loaded
        .task {
            subtrahend = Int.random(in: 1...minuend)
        }
        
    }
}

struct SubtractionView_Previews: PreviewProvider {
    static var previews: some View {
        SubtractionView()
    }
}
