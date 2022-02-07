//
//  ContentView.swift
//  CountDown
//
//  Created by Angelos Staboulis on 7/2/22.
//

import SwiftUI

struct ContentView: View {
    var timer = Timer.publish(every: 1, tolerance: 1, on: .main, in: .common, options: .none).autoconnect()
    @State var counter:Int!=59
    var body: some View {
        VStack{
            HStack{
                Text("CountDown-Timer").font(Font.largeTitle)
            }
            HStack{
                Text("00:"+String(counter < 10 ? "0" + String(counter) : String(counter)))
                    .padding()
                    .onReceive(timer) { publisher in
                        incrementCounter()
                    }
            }
        }
        .font(Font.largeTitle)
       
        
    }
    func incrementCounter(){
        if self.counter == 0 {
            self.counter = 59
        }
        else{
            self.counter = self.counter - 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
