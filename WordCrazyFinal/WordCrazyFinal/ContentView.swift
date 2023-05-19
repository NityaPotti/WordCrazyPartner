//
//  ContentView.swift
//  WordCrazy
//
//  Created by 90310702 on 4/17/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
               Image("bgHome")
               .resizable()
               .aspectRatio(contentMode: .fill)
               .frame(minWidth:0, maxWidth: .infinity)
               .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    NavigationLink(destination:GameScreen()
                        .frame(width:500,height:550)
                        .padding()
                        .background(.white)
                        .overlay(Rectangle().stroke(.purple))
                                   , label: { Text("Play!")
                            .bold()
                            .frame(width:100, height: 100)
                            .background(.black)
                    })
                    
                    
                }
                .padding()
            }}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct GameScreen: View {
    
    var alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "p", "r", "s", "t", "w"]
    @State var questions = ["Fast Food chains", "Minnesota Cities", "Female Pop Singers", "animals", "Desserts", "Chocolate or Candy Brands", "Fruits", "Male Actors", "Musical Instruments", "YA Books", "TV Shows"]
    @State var answer1 = []
    
    func storeAnswer(answer: String)
    {
        answer1.append(answer)
        questions.remove(at: indexQuestion-score)
    }
    
    func changeQuestion() -> String
    {
        textFieldText = ""
        return "Your question is: " + questions[indexQuestion]
    }
    func nextQuestion()
    {
        
        if(indexQuestion<=questions.count)
        {
            indexQuestion += 1
        }
        changeQuestion()
    }
    func previousQuestion()
    {
        if(indexQuestion>=0)
        {
            indexQuestion -= 1
        }
        changeQuestion()
    }
    
    @State var score = 0;
    @State var indexQuestion = 0
    @State var textFieldText: String = ""
    @State var randomInt = Int.random(in: 0...18)
    @State var countDownTimer = 2
    @State var timerRunning = true
    @State var randomAlphabet:String = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    //@State private var path = NavigationPath()
    
    var body: some View {
        
            ZStack{
                Image("bgGame")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth:0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing:5)
                {
                    let randomAlphabet = alphabet[randomInt]
                    Text("Your letter is: " + randomAlphabet)
                    
                    Text(changeQuestion()).frame(maxWidth:500).padding()
                    
                    Text("Time Remaining: " + "\(countDownTimer)")
                        .onReceive(timer) { _ in
                            if countDownTimer > 0 && timerRunning
                            {
                                countDownTimer -= 1
                            } else
                            {
                                timerRunning = false
                        
                                    .alert("Important message", isPresented: $timerRunning) {
                                                Button("OK", role: .cancel) { }
                                            }
                                    
                                
                                
                            }
                            
                        }
                    
                    // changeQuestion()
                    if(timerRunning)
                    {
                        TextField("Enter your answer here in all lowercase (exclude the word 'the' from your answer and all other punctuation): ", text: $textFieldText)
                            .frame(maxWidth:200)
                            .padding()
                            .background(Color.pink.opacity(0.5).cornerRadius(10))
                            .foregroundColor(.black)
                        
                    }
                    
                    Button(action: {storeAnswer(answer:textFieldText); nextQuestion()}, label:{
                        Text("SAVE ANSWER")
                            .padding()
                            .frame(maxWidth: 200)
                            .background(Color.blue.opacity(0.5).cornerRadius(10))
                            .foregroundColor(.white)
                            .font(.headline)
                        
                        
                    })
                    /* NavigationStack(path: $path)
                     {
                     Text("ContentView")
                     .navigationDestination(for: String.self) { view in
                     if timerRunning == false {
                     Text("timesUp")
                     }
                     }
                     }*/
                    /*  .onAppear {
                     DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                     path.append("timesUp")
                     }
                     }*/
                    HStack{
                        Button(action: {previousQuestion()}, label:{
                            Text("BACK")
                                .padding()
                                .frame(maxWidth: 200)
                                .background(Color.blue.opacity(0.5).cornerRadius(10))
                                .foregroundColor(.white)
                                .font(.headline)
                            
                            
                        })
                        Button(action: {nextQuestion()}, label:{
                            Text("NEXT")
                                .padding()
                                .frame(maxWidth: 200)
                                .background(Color.blue.opacity(0.5).cornerRadius(10))
                                .foregroundColor(.white)
                                .font(.headline)
                            
                            
                        })
                    }
                    
                    
                    Text("Score: " + "\(score)")
                }
                
                
            }
        }
        
        
    }

