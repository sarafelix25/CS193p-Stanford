//
//  Card.swift
//  Concentration
//
//  Created by sara.batista.d.felix on 28/04/21.
//  Copyright © 2021 Stanford. All rights reserved.
//

import Foundation

struct Card: Hashable
{
    var hashValue: Int {
        return identifier
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool{
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
static var identifierFactory = 0
    
    static func getUniqueIdentifier () -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}

