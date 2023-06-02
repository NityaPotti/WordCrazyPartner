//
//  directions.swift
//  WordCrazyFinal
//
//  Created by 90310702 on 5/31/23.
//
import SwiftUI

import Foundation
struct directions: View {
    
    var body: some View {
        GeometryReader { geometry in
            ZStack
            {
                Image("bgTimesUp")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth:0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading){
                    Text("You will get a random letter from A-Z. You will also get a list of topic areas. You must enter an answer that fits the topic area and starts with the letter you were given. Player 1 will start and then Player 2 will follow once Player 1's time is up. Each player has 30 seconds to get as many answers in as possible. After both turns are up, the players will check each other's answers and add points to the other's score for each correct answer. Whoever has the most points, wins!")
                        .frame(width:300)
                    
                    
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
                }.foregroundColor(.white)
            
                
            }.frame(maxWidth: geometry.size.width)
        }
    }
    }

