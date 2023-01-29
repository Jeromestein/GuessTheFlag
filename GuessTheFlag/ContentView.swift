//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jiayi on 1/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
        .shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var scoreTitle = ""
    @State private var showingScore = false
    @State private var score = 0
    
    var body: some View {
        ZStack {
            /**
             Background
             */
//            LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
//                .cornerRadius(10)
//                .background(.ultraThinMaterial)
//                .ignoresSafeArea()
            
            VStack(spacing: 30){
                Text("Guess The Flag")
                    .font(.largeTitle.weight(.bold))
                    
                VStack{
                    Text("Tap The Flag Of")
                        .font(.headline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .font(.largeTitle.weight(.semibold))
                }
                .padding()
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number: number)
                    } label: {
                        Image(countries[number])
                            .renderingMode(.original)
                            .shadow(radius: 5)
                    }
                }
                .padding()
                
                Text("Score: \(score)")
                    .font(.largeTitle.weight(.bold))
            }
            .padding()
        }
        .padding()
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your Score is \(score)")
        }
        
        
    }
    
    func flagTapped(number: Int)  {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
