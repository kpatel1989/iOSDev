//
//  stockholder.swift
//  nandiniassignment
//
//  Created by Owner on 2015-09-28.
//  Copyright © 2015 nandini. All rights reserved.
//

import Foundation

import Foundation


public class StockHolding {
    
    public var company: String
    public var purchaseSharePrice: Float
    public var currentSharePrice: Float
    public var numberOfShares: Int
    
    //    public var costInDollars: Float
    //   public var valueInDollars: Float
    
    
    public init(company: String, purchaseSharePrice: Float, currentSharePrice: Float, numberOfShares: Int)
    {
        
        self.company = company
        self.purchaseSharePrice = purchaseSharePrice
        self.currentSharePrice = currentSharePrice
        self.numberOfShares = numberOfShares
    }
    
    //       costInDollars = purchaseSharePrice * Float(numberOfShares)
    //       valueInDollars = currentSharePrice * Float(numberOfShares)
    
    public func costInDollars() -> Float
    {
        return purchaseSharePrice * (Float)(numberOfShares)
        
    }
    
    public func valueInDollars() -> Float
    {
        return currentSharePrice * (Float)(numberOfShares)
        
    }
    
    public func profitInDollars() -> Float
    {
        return valueInDollars() - costInDollars()
        
    }
    
    
    
    public func printStockHolding()
    {
        print("===========================================")
        print("company: \(company)")
        print("purchaseSharePrice: \(purchaseSharePrice)")
        print("currentSharePrice: \(currentSharePrice)")
        print("numberOfShares: \(numberOfShares)")
        print("costInDollars: \(costInDollars())")
        print("valueInDollars: \(valueInDollars())")
        print("profitInDollars: \(profitInDollars())")
    }
    
}
