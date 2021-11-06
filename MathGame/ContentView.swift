//
//  ContentView.swift
//  MathGame
//
//  Created by Federico on 04/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var correctAnswer = 0
    @State private var choiceArray : [Int] = [0, 1, 2, 3]
    @State private var firstNumber = 0
    @State private var secondNumber = 0
    @State private var difficulty = 1000
    @State private var score = 0
    
    
    var body: some View {
        VStack {
            Text("\(firstNumber) + \(secondNumber)")
                .font(.largeTitle)
                .bold()
            
            HStack {
                ForEach(0..<2) {index in
                    Button {
                        answerIsCorrect(answer: choiceArray[index])
                        generateAnswers()
                    } label: {
                        AnswerButton(number: choiceArray[index])
                    }
                }
            }
            
            HStack {
                ForEach(2..<4) {index in
                    Button {
                        answerIsCorrect(answer: choiceArray[index])
                        generateAnswers()
                    } label: {
                        AnswerButton(number: choiceArray[index])
                    }
                }
            }
            Text("Score: \(score)")
                .font(.headline)
                .bold()
        }.onAppear(perform: generateAnswers)
        
        
    }
    
    func answerIsCorrect(answer: Int){
        let isCorrect = answer == correctAnswer ? true : false
        
        if isCorrect {
            self.score += 1
        } else {
            self.score -= 1
        }
    }
    
    
    func generateAnswers(){
        firstNumber = Int.random(in: 0...(difficulty/2))
        secondNumber = Int.random(in: 0...(difficulty/2))
        var answerList = [Int]()
        
        correctAnswer = firstNumber + secondNumber
        
        for i in 0...2 {
            answerList.append(Int.random(in: 0...difficulty))
        }
        
        answerList.append(correctAnswer)
        
        choiceArray = answerList.shuffled()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
