//
//  ReactionAnimationView.swift
//  ArithmeticAce
//
//  Created by Joyce Tao on 2022-02-15.
//

import SwiftUI

struct ReactionAnimationView: View {
    
    // MARK: Stored properties
    let happyReactionName: String
    let sadReactionName: String
    let answerCorrect: Bool
    let answerChecked: Bool
    
    // MARK: Computed properties
    var body: some View {
        ZStack {
            
            // Show the reaction animation - correct answer
            LottieView(animationNamed: happyReactionName)
                // Only show the animation when the answer given is correct
                .opacity(answerCorrect ? 1.0 : 0.0)
            
            // Show the reaction animation - incorrect answer
            LottieView(animationNamed: sadReactionName)
                // Only show the animation when the answer given is incorrect
                .opacity(answerCorrect == false && answerChecked == true ? 1.0 : 0.0)
            
        }
    }
}
