//
//  forignstock.swift
//  nandiniassignment
//
//  Created by Owner on 2015-09-28.
//  Copyright © 2015 nandini. All rights reserved.
//

import Foundation
public class ForeignStockHolding: StockHolding {
    
    public var conversionRate: Float!
    
    public init?(company: String, purchaseSharePrice: Float, currentSharePrice: Float, numberOfShares: Int, conversionRate: Float) {
        
        super.init(company: company, purchaseSharePrice: purchaseSharePrice, currentSharePrice: currentSharePrice, numberOfShares: numberOfShares)
        
        if conversionRate < 0.0 {
            return nil
        }
        
        self.conversionRate = conversionRate
    }
    
    public override func costInDollars() -> Float {
        return conversionRate * (super.costInDollars())
    }
    
    public override func valueInDollars() -> Float {
        return conversionRate * (super.valueInDollars())
    }
    public override func profitInDollars() -> Float {
        return valueInDollars() - costInDollars()
        
    }
    
    
    func printStockHolding2() {
        super.printStockHolding()
        print("conversionRate: \(conversionRate)")
        
    }
    
}

