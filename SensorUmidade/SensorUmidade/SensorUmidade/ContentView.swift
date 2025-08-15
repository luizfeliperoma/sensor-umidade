//
//  ContentView.swift
//  SensorUmidade
//
//  Created by Turma02 on 21/07/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.blue
            ScrollView {
                VStack {
                    ForEach(viewModel.sensorUmidade, id: \.id) { sensorU in
                        Text (sensorU.umidade ?? "")
                            .foregroundColor(.black)
                    }
                    .font(.headline)
                }
                
            }
        }
        .onAppear() {
            viewModel.fetch()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
