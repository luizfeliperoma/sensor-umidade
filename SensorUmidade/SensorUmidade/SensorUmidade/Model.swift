//
//  Model.swift
//  SensorUmidade
//
//  Created by Turma02 on 21/07/25.
//

import Foundation

struct Model: Decodable, Hashable {
    let id = UUID()
    let umidade: String?
}

