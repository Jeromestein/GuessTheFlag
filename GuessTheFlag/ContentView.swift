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
    
    var body: some View {
        VStack {
            VStack{
                Text("Tap The Flag Of")
                Text(countries[correctAnswer])
            }
            
            ForEach(0..<3) { number in
                Button {
                    flagTapped(number: number)
                } label: {
                    Image(countries[number])
                        .renderingMode(.original)
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your Score is ???")
        }
        
        
    }
    
    func flagTapped(number: Int)  {
        if number == correctAnswer {
            scoreTitle = "Correct"
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
