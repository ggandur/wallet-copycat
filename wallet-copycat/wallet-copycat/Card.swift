//
//  Card.swift
//  IOS-Wallet-Copycat
//
//  Created by Matheus Barbosa on 23/05/23.
//

import Foundation
import SwiftUI

//Sample Card Model and Data
struct Card: Identifiable {
    var id = UUID().uuidString
    var name: String
    var cardNumber: String
    var cardImage: String
}
