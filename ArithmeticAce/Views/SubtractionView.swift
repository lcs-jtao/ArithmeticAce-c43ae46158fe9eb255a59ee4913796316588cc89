//
//  SubtractionView.swift
//  ArithmeticAce
//
//  Created by Joyce Tao on 2022-02-11.
//

import SwiftUI

struct SubtractionView: View {
    // MARK: Stored properties
    @Environment(\.scenePhase) var scenePhase
    @State var minuend = Int.random(in: 1...144)
    @State var subtrahend = 0
    
    // This string contains whatever the user types in
    @State var inputGiven = ""
    
    // Has an answer been checked?
    @State var answerChecked = false
    
    // Was the answer given actually correct?
    @State var answerCorrect = false
    
    @State var equationList: [Equation] = []
    
    // MARK: Computed properties
    // What is the correct difference?
    var correctDifference: Int {
        return minuend - subtrahend
    }
    
    var completeEquation: String {
        return "\(minuend) - \(subtrahend) = \(correctDifference)"
    }
    
    var body: some View {
                
        VStack(spacing: 0) {
            QuestionPresentationView(operation: "-", firstValue: minuend, secondValue: subtrahend)
            
            Divider()
            
            AnswerAndResultView(answerCorrect: answerCorrect, answerChecked: answerChecked, inputGiven: $inputGiven)
            
            ZStack {
                CheckAnswerView(answerChecked: $answerChecked, answerCorrect: $answerCorrect, correctAnswer: correctDifference, inputGiven: inputGiven, completeEquation: completeEquation, equationList: $equationList)
                
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
            
            //ReactionAnimationView(happyReactionName: "9891-happy-donut", sadReactionName: "84655-swinging-sad-emoji", answerCorrect: answerCorrect, answerChecked: answerChecked)
            
            List(equationList, id: \.self) { oneEquation in
                EquationListView(equation: oneEquation.fullEquation, inputAnswer: oneEquation.givenAnswer, status: oneEquation.wasCorrect)
            }
            .font(.system(size: 25))

            Spacer()
        }
        
        .onChange(of: scenePhase) { newPhase in
            
            if newPhase == .inactive {
                
                print("Inactive")
                
            } else if newPhase == .active {
                
                print("Active")
                
            } else if newPhase == .background {
                
                print("Background")
                
                persistFavourites()
                
            }
            
        }
        .padding(.horizontal)
        .font(.system(size: 72))
        // This code block (closure) runs once when the view is first loaded
        .task {
            subtrahend = Int.random(in: 1...minuend)
            loadFavourites()
        }
        
    }
    
    // MARK: Functions
    func persistFavourites() {
        
        let filename = getDocumentsDirectory().appendingPathComponent(savedEquationsLabel)
        
        do {
            let encoder = JSONEncoder()

            encoder.outputFormatting = .prettyPrinted
            
            let data = try encoder.encode(equationList)
            
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
            
            print("Saved data to documents directory successfully.")
            print("===")
            print(String(data: data, encoding: .utf8)!)
            
        } catch {
            
            print(error.localizedDescription)
            print("Unable to write list of solved equations to documents directory in app bundle on device.")
            
        }

    }
    
    func loadFavourites() {
        
        let filename = getDocumentsDirectory().appendingPathComponent(savedEquationsLabel)
        print(filename)
                
        do {
            
            let data = try Data(contentsOf: filename)
            
            print("Got data from file, contents are:")
            print(String(data: data, encoding: .utf8)!)

            equationList = try JSONDecoder().decode([Equation].self, from: data)
            
        } catch {
            
            print(error.localizedDescription)
            print("Could not load data from file, initializing with tasks provided to initializer.")

        }

    }
    
}

struct SubtractionView_Previews: PreviewProvider {
    static var previews: some View {
        SubtractionView()
    }
}
