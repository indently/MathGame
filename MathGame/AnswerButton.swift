//
//  AnswerButton.swift
//  MathGame
//
//  Created by Federico on 04/11/2021.
//

import SwiftUI

struct AnswerButton: View {
    var number : Int
    
    var body: some View {
        Text("\(number)")
        .frame(width: 110, height: 110)
        .font(.system(size: 40, weight: .bold))
        .foregroundColor(Color.white)
        .background(Color.blue)
        .clipShape(Circle())
        .padding()
    }
}

struct AnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        AnswerButton(number: 1000)
    }
}
