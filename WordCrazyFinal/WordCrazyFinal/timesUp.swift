//
//  timesUp.swift
//  WordCrazyFinal
//
//  Created by 90310702 on 5/15/23.
//

import Foundation
import UIKit
import SwiftUI
struct timesUp: View {
    //@Binding var player1Answer :Int
   // @State var answer = []
    //init(player1Answer: Binding<Int>) {
     //   self._player1Answer = player1Answer
    
   // @StateObject var appInfo1 = appInformation()
    @State var player1 = 0
    @State var Alist: [String] = []
    init(answers: Int, answerList: [String]) {
       player1 = answers
        Alist = answerList
        print(player1)
        print(Alist)
    }
    
    var body: some View {
        
        
        ZStack{
            if(player1==0)
            {
                Text("hi")
            }
            Image("bgTimesUp")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth:0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            ForEach(Alist, id: \.self){ i in
                Text(i)
            }
            }
        }
        
    }

