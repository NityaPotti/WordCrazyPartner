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
                    NavigationLink(destination:directions()
                        .frame(width:500,height:550)
                        .padding()
                        .background(.white)
                        .overlay(Rectangle().stroke(.purple))
                                   , label: { Text("Read Directions")
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
    @State var questions = ["Fast Food chains", "Minnesota Cities", "Female Pop Singers", "animals", "Desserts", "Chocolate or Candy Brands", "Fruits", "Male Actors", "Musical Instruments", "YA Books", "TV Shows", "Movies","Tech companies", "Colors"]
    @State var answer1: [String] = []
    @State var answer2: [String] = []
    
    func separatingAnswers()
    {
        for i in player1Answer...answer1.count-1
        {
            answer2.append(answer1[i])
        }
        print(answer2)
        for i in player1Answer...answer1.count-1
        {
            answer1.remove(at: player1Answer)
        }
        questions = ["Fast Food chains", "Minnesota Cities", "Female Pop Singers", "animals", "Desserts", "Chocolate or Candy Brands", "Fruits", "Male Actors", "Musical Instruments", "YA Books", "TV Shows","Movies","Tech companies", "Colors"]
        for i in 0...player1Answer-1
        {
            count.append(i)
        }
        checkAnswerPressed = true
    }
    func reset()
    {
        questions = ["Fast Food chains", "Minnesota Cities", "Female Pop Singers", "animals", "Desserts", "Chocolate or Candy Brands", "Fruits", "Male Actors", "Musical Instruments", "YA Books", "TV Shows", "Movies","Tech companies", "Colors"]
        countDownTimer = 30
        timerRunning = true
        showAlert = false
        player2 = true
        player1 = false
        answer1Check = true
        indexQuestion = 0
        
    }
    func storeAnswer(answer: String)
    {
        
        answer1.append(answer)
        //if(indexQuestion-questionsAnswered>0)
       // {
            questions.remove(at: 0)
        //}
        //else
        //{
         //   questions.remove(at:0)
       // }
        //questionsAnswered += 1
        if(player1)
        {
            player1Answer += 1
        }
    }
    
    func changeQuestion() -> String
    {
        textFieldText = ""
        if(player2)
        {
            return "Your question is: " + questions[0]
        }
         return "Your question is: " + questions[0]
        
        

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
    func increaseScore()
    {
        player1Score += 1
        if(player1Score==answer1.count)
        {
            player2 = false
            player2AnswerCheck = true
            answer1Check = false
            for i in 0...answer2.count-1
            {
                count2.append(i)
                
            }
            print(count2)
        }
        for i in 0...answer2.count-1
        {
            count2.append(i)
            
        }
        
    }
    func increaseP2Score()
    {
        player2Score += 1
        
    }
    func changeScreens()
    {
        player2 = false
        player2AnswerCheck = true
        answer1Check = false
        
    }
    func scoreScreen()
    {
        player2 = false
        player2AnswerCheck = false
        answer1Check = false
        scoreScreens = true
    }
    
    @State var player1Score = 0
    @State var player2Score = 0
    @State var questionsAnswered = 0
    @State var indexQuestion = 0
    @State var textFieldText: String = ""
    @State var randomInt = Int.random(in: 0...18)
    @State var countDownTimer = 30
    @State var timerRunning = true
    @State var showAlert = false
    @State var randomAlphabet:String = ""
    @State var player2 = false
    @State var showAlert2 = false
    @State var player1 = true
    @State var answer1Check = false
    @State var player2AnswerCheck = false
    @State var player1Answer = 0
    @State var checkAnswerPressed = false
    @State var count: [Int] = []
    @State var count2: [Int] = []
    @State var scoreScreens = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
    var body: some View {
        ZStack{
            if(!timerRunning && player2)
            {
                Image("bgTimesUp")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth:0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
            }
            else
            {
                Image("bgGame")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth:0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
            }
            VStack(spacing:5)
            {
            if(!timerRunning && player2)
            {
              Button(action: {separatingAnswers()}, label:{
                Text("CHECK ANSWERS")
                  .padding()
                  .frame(maxWidth: 200)
                  .background(Color.blue.opacity(0.5).cornerRadius(10))
                  .foregroundColor(.white)
                  .font(.headline)
                    })
                }
                if(checkAnswerPressed && answer1Check)
                {
                    ForEach(count, id: \.self)
                    {i in
                        Text(questions[i] + ": " + answer1[i])
                    }
                    Button(action: {increaseScore()}, label:{
                        Text("ADD POINT TO PLAYER 1'S SCORE")
                            .padding()
                            .frame(maxWidth: 200)
                            .background(Color.blue.opacity(0.5).cornerRadius(10))
                            .foregroundColor(.white)
                            .font(.headline)
                    })
                    Text("Score: " + "\(player1Score)")
                    Button(action: {changeScreens()}, label:{
                        Text("DONE!")
                            .padding()
                            .frame(maxWidth: 200)
                            .background(Color.blue.opacity(0.5).cornerRadius(10))
                            .foregroundColor(.white)
                            .font(.headline)
                    })
                }
                else if(!timerRunning && player2AnswerCheck)
                {
                    ForEach(count2, id: \.self)
                    {i in
                        Text(questions[i] + ": " + answer2[i])
                    }
                    Button(action: {increaseP2Score()}, label:{
                        Text("ADD POINT TO PLAYER 2'S SCORE")
                            .padding()
                            .frame(maxWidth: 200)
                            .background(Color.blue.opacity(0.5).cornerRadius(10))
                            .foregroundColor(.white)
                            .font(.headline)
                    })
                    Text("Score: " + "\(player2Score)")
                    Button(action: {scoreScreen()}, label:{
                        Text("DONE!")
                            .padding()
                            .frame(maxWidth: 200)
                            .background(Color.blue.opacity(0.5).cornerRadius(10))
                            .foregroundColor(.white)
                            .font(.headline)
                    })
                }
                else if(scoreScreens)
                {
                    if(player1Score>player2Score)
                    {
                        Text("Player 1 is the winner!")
                            .font(.system(size: 20))
                    }
                    else if(player2Score>player1Score)
                    {
                        Text("Player 2 is the winner!")
                            .font(.system(size: 20))
                    }
                    else
                    {
                        Text("You tied!")
                            .font(.system(size: 20))
                    }
                }
                else
                {
                    let randomAlphabet = alphabet[randomInt]
                    
                    Text("Your letter is: " + randomAlphabet)
                        .font(.system(size: 50))
                    Text(changeQuestion()).frame(maxWidth:500).padding()
                    Text("Time Remaining: " + "\(countDownTimer)")
                        .onReceive(timer) { _ in
                            if countDownTimer > 0 && timerRunning
                            {
                                countDownTimer -= 1
                            } else
                            {
                                timerRunning = false
                                if(player1)
                                {
                                    showAlert = true
                                }
                            }
                        }
                        .alert("Switch Player", isPresented: $showAlert) {
                            Button("I'm Ready", role: .cancel, action: reset)
                        }
                    if(timerRunning)
                    {
                        TextField("Enter your answer here in all lowercase (exclude the word 'the' from your answer and all other punctuation): ", text: $textFieldText)
                            .frame(maxWidth:200)
                            .padding()
                            .background(Color.pink.opacity(0.5).cornerRadius(10))
                            .foregroundColor(.black)
                        Button(action: {storeAnswer(answer:textFieldText); nextQuestion()}, label:{
                            Text("SAVE ANSWER")
                                .padding()
                                .frame(maxWidth: 200)
                                .background(Color.blue.opacity(0.5).cornerRadius(10))
                                .foregroundColor(.white)
                                .font(.headline)
                        })
                    }
                }
            }
        }
    }
}
