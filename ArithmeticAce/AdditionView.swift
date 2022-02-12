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
    
    // MARK: Computed properties
    // What is the correct sum?
    var correctSum: Int {
        return augend + addend
    }
    
    var body: some View {
                
        VStack(spacing: 0) {
            HStack {
                Text("+")
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("\(augend)")
                    Text("\(addend)")
                }
            }
            
            Divider()
            
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
            
            ZStack {
                Button(action: {
                    
                    // Answer has been checked!
                    answerChecked = true
                    
                    // Convert the input given to an integer, if possible
                    guard let sumGiven = Int(inputGiven) else {
                        // Sadness, not a number
                        answerCorrect = false
                        return
                    }

                    // Check the answer!
                    if sumGiven == correctSum {
                        // Celebrate! 👍🏼
                        answerCorrect = true
                    } else {
                        // Sadness, they gave a number, but it's not correct 😭
                        answerCorrect = false
                    }
                }, label: {
                    Text("Check Answer")
                        .font(.largeTitle)
                })
                    .padding()
                    .buttonStyle(.bordered)
                    .opacity(answerChecked ? 0.0 : 1.0)
                
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
            
            ZStack {
                
                // Show the reaction animation - correct answer
                LottieView(animationNamed: "9891-happy-donut")
                    // Only show the animation when the answer given is correct
                    .opacity(answerCorrect ? 1.0 : 0.0)
                
                // Show the reaction animation - incorrect answer
                LottieView(animationNamed: "84655-swinging-sad-emoji")
                    // Only show the animation when the answer given is incorrect
                    .opacity(answerCorrect == false && answerChecked == true ? 1.0 : 0.0)
                
            }
            
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
