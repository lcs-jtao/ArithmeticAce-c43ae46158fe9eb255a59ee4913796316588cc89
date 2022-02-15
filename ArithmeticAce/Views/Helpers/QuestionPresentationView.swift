//
//  QuestionPresentationView.swift
//  ArithmeticAce
//
//  Created by Joyce Tao on 2022-02-15.
//

import SwiftUI

struct QuestionPresentationView: View {
    
    // MARK: Stored properties
    let operation: String
    let firstValue: Int
    let secondValue: Int
    
    // MARK: Computed properties
    var body: some View {
        
        HStack {
            
            Text(operation)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(firstValue)")
                Text("\(secondValue)")
            }
        }
    }
}

struct QuestionPresentationView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionPresentationView(operation: "+", firstValue: 10, secondValue: 5)
    }
}

