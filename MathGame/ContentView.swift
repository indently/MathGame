//
//  ContentView.swift
//  MathGame
//
//  Created by Federico on 04/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State var correctAnswer = 0
    @State var choiceArray : [Int] = [0, 1, 2, 3]
    @State var firstNumber = Int.random(in: 0...100)
    @State var secondNumber = Int.random(in: 0...100)
    @State var score = 0
    
    
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
        firstNumber = Int.random(in: 0...100)
        secondNumber = Int.random(in: 0...100)
        var answerList = [Int]()
        
        correctAnswer = firstNumber + secondNumber
        
        for i in 0...2 {
            answerList.append(Int.random(in: 0...200))
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
