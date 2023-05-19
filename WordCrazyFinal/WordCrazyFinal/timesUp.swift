//
//  timesUp.swift
//  WordCrazyFinal
//
//  Created by 90310702 on 5/15/23.
//

import Foundation
import SwiftUI
struct timesUp: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("bgTimesUp")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth:0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}
