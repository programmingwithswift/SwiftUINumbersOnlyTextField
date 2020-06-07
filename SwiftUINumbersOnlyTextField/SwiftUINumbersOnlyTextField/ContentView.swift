//
//  ContentView.swift
//  SwiftUINumbersOnlyTextField
//
//  Created by ProgrammingWithSwift on 2020/06/07.
//  Copyright © 2020 ProgrammingWithSwift. All rights reserved.
//

import SwiftUI

class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject var input = NumbersOnly()
    
    var body: some View {
        TextField("Input", text: $input.value)
            .padding()
            .keyboardType(.decimalPad)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
