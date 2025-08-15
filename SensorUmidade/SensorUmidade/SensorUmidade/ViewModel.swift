//
//  ViewModel.swift
//  SensorUmidade
//
//  Created by Turma02 on 21/07/25.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var sensorUmidade: [Model] = []

    func fetch() {
        guard let url = URL(string: "http://192.168.128.31:1880/leituraArduino") else {
            print("URL inválida")
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                print("Erro no dataTask:", error ?? "")
                return
            }

            do {
                let parsed = try JSONDecoder().decode([Model].self, from: data)
                DispatchQueue.main.async {
                    self?.sensorUmidade = parsed
                }
            } catch {
                print("Falha ao decodificar JSON:", error)
            }
        }
        .resume()
    }
}
