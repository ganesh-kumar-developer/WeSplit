//
//  ContentView.swift
//  WeSplit
//
//  Created by Ganesh Kumar on 12/08/23.
//

import SwiftUI

struct ContentView: View {
    @State var checkAmount: Double = 0.0
    @State var numOfPeople: Int = 2
    @State var tipPercentage: Int = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Group {
                        TextField("Enter Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .keyboardType(.numberPad)
                    }
                    Picker("No of People", selection: $numOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) People")
                        }
                    }
//                    .pickerStyle(.segmented)
//                    .fontWeight(.bold)
//                    .font(.system(size: 40, design: .rounded))
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text ("How much tip would you like to give")
                }
                
                Section {
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("We Split")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
