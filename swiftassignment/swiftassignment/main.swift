//
//  main.swift
//  nandiniassignment
//
//  Created by Owner on 2015-09-28.
//  Copyright © 2015 nandini. All rights reserved.
//

import Foundation

print("Hello, World!")

// part - 1.


let stock1 = StockHolding(company: "TCS", purchaseSharePrice: 2.30, currentSharePrice: 4.50, numberOfShares: 40)
let stock2 = StockHolding(company: "INFOSYS", purchaseSharePrice: 12.19, currentSharePrice: 10.56, numberOfShares: 90)
let stock3 = StockHolding(company: "HP", purchaseSharePrice:45.10 , currentSharePrice:49.51 , numberOfShares:210 )


var holdingArrary:[StockHolding] = []
holdingArrary.append(stock1)
holdingArrary.append(stock2)
holdingArrary.append(stock3)

var companyArray1: [String] = []

for var i = 0; i < holdingArrary.count ; i++ {
    companyArray1.insert(holdingArrary[i].company, atIndex: i)
}

let sortCompany = companyArray1.sort( < )
//                print("\(companyArray1.description)")
//                print("\(sortCompany.description)") // sorting by company name


print("**************** QUESTION 1.*****************\n")

for var i = 0; i < sortCompany.count; i++
{
    for var j = 0; j < holdingArrary.count; j++ {
        if sortCompany[i] == holdingArrary[j].company {
            holdingArrary[j].printStockHolding()
            print("")
            break
        }
    }
}






// part - 2.


let stock4 = ForeignStockHolding(company: "APPLE", purchaseSharePrice: 2.30, currentSharePrice: 4.50, numberOfShares: 40, conversionRate: 0.94)

let stock5 = ForeignStockHolding(company: "MICROSOFT", purchaseSharePrice: 19.85, currentSharePrice: 24.69, numberOfShares: 150, conversionRate: 0.95)




holdingArrary.append(stock4!)
holdingArrary.append(stock5!)


var companyArray2: [String] = []

for var i = 0; i < holdingArrary.count ; i++
{
    companyArray2.insert(holdingArrary[i].company, atIndex: i)
}




let sortAllCompany = companyArray2.sort( > )


//print("\(sortAllCompany.description)")

print("************** QUESTION 2 *****************\n")

for var i = 0; i < sortAllCompany.count; i++
{
    for var j = 0; j < holdingArrary.count; j++
    {
        
        if sortAllCompany[i] == holdingArrary[j].company
        {
            holdingArrary[j].printStockHolding()
            
            print("")
            
            break
        }
    }
}




// part - 3.



func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let strData = NSString(data: inputData, encoding: NSUTF8StringEncoding)!
    
    return strData.stringByTrimmingCharactersInSet(NSCharacterSet.newlineCharacterSet())
}


extension String {
    func arrayBySpliting(splitter: String? = nil) -> [String] {
        if let s = splitter {
            return self.componentsSeparatedByString(s)
        } else {
            return self.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        }
        
    }
}


var newHoldingArrary:[StockHolding] = []
var newForeignHoldingArrary:[ForeignStockHolding] = []


print("***************** QUESTION 3 *********************\n")
print("How many stocks are going to be entered? (Choose 1 ~ 8, maximum 8)")
var numberOfStock = input()

if Int(numberOfStock) > 8
{
    print("Maximum number is 8")
    
} else {
    
    
    // insert information of input data to array
    
    for var i = 0; i < Int(numberOfStock) ; i++ {
        
        print("\nYou are going to input Information in(choose 1 or 2)\n 1. Stocks\n 2. Foreign Stocks")
        var choiceString = input()
        
        if Int(choiceString) == 1 {
            print("\nEnter information of Stock. \nFollow the format. \ncompany,purchaseSharePrice,currentSharePrice,numberOfShares")
            
            var inputStockHolding = input()
            
            
            var inputStockHolding1 = inputStockHolding.arrayBySpliting(",")
            
            let n = numberOfStock
            for var n = 0; n < Int(numberOfStock) ; n++
            {
                var inputHoldingArray = StockHolding(company: inputStockHolding1[0], purchaseSharePrice: Float(inputStockHolding1[1])!, currentSharePrice: Float(inputStockHolding1[2])!, numberOfShares: Int(inputStockHolding1[3])!)
                
                newHoldingArrary.append(inputHoldingArray)
            }
        }
            
        else {
            if Int(choiceString) == 2 {
                print("\nEnter information of Stock. \nFollow the format. \ncompany,purchaseSharePrice,currentSharePrice,numberOfShares,conversionRate")
                var inputForeignStockHolding = input()
                
                var inputForeignStockHolding1 = inputForeignStockHolding.arrayBySpliting(",")
                
                var inputForeignHoldingArray = ForeignStockHolding(company: inputForeignStockHolding1[0], purchaseSharePrice: Float(inputForeignStockHolding1[1])!, currentSharePrice: Float(inputForeignStockHolding1[2])!, numberOfShares: Int(inputForeignStockHolding1[3])!, conversionRate: Float(inputForeignStockHolding1[4])!)
                
                newHoldingArrary.append(inputForeignHoldingArray!)
                
            }
        }
    }
}


// collect Value
var newAllValue: [Float] = []

for var i = 0; i < Int(numberOfStock) ; i++
{
    newAllValue.insert(newHoldingArrary[i].valueInDollars(), atIndex: i)
}

// collect profit
var newAllProfit: [Float] = []

for var i = 0; i < Int(numberOfStock) ; i++
{
    newAllProfit.insert(newHoldingArrary[i].profitInDollars(), atIndex: i)
}

print("\(newAllProfit.description)")


public func displayMenu()
{
    print("\nSelect Display Option\n1. Display Stock Information with Lowest Value\n2. Display Stock with highest Value\n3. Display the most profitable Stock\n4. Display the least profitable Stock\n5. All stocks sorted by company name\n6. Stocks from lowest value to higher value\n7. Hit Enter to EXIT")
    
    let selectdisnumber = input()
    
    displayOption(selectdisnumber)
}




public func displayOption(value: String){
    switch(value) {
    case "1":
        print("The Lowest Value Stock\n")
        printLowestValue()
        displayMenu()
        
    case "2":
        print("The Highest Value Stock\n")
        printHighestValue()
        displayMenu()
        
    case "3":
        print("The Most Profit Stock\n")
        printMostProfit()
        displayMenu()
        
    case "4":
        print("The Least Profit Stock\n")
        printLeastProfit()
        displayMenu()
        
    case "5":
        print("Sorted Stocks by Company\n")
        printSortByCompany()
        displayMenu()
        
    case "6":
        print("Sorted Stock by Value\n")
        printSortedValue()
        displayMenu()
        
    case "7":
        exit()
    default:
        print("Invalid Input.")
    }
}




public func printSortByCompany()
{
    var newAllCompany: [String] = []
    
    for var i = 0; i < Int(numberOfStock) ; i++
    {
        newAllCompany.insert(newHoldingArrary[i].company, atIndex: i)
    }
    
    
    let newsortAllCompany = newAllCompany.sort( < )
    
    
    for var i = 0; i < Int(numberOfStock) ; i++
    {
        for var j = 0; j < newHoldingArrary.count; j++
        {
            
            if newsortAllCompany[i] == newHoldingArrary[j].company
            {
                newHoldingArrary[j].printStockHolding()
                
                print("")
                
                break
            }
        }
    }
}


public func printLowestValue() {
    
    let newsortAllValue = newAllValue.sort( < )
    
    for var j = 0; j < newHoldingArrary.count; j++
    {
        if newsortAllValue[0] == newHoldingArrary[j].valueInDollars()
        {
            newHoldingArrary[j].printStockHolding()
            
            print("")
            
            break
        }
    }
}


public func printHighestValue() {
    
    let newsortAllValue = newAllValue.sort( > )
    
    for var j = 0; j < newHoldingArrary.count; j++
    {
        if newsortAllValue[0] == newHoldingArrary[j].valueInDollars()
        {
            newHoldingArrary[j].printStockHolding()
            
            print("")
            
            break
        }
    }
}


public func printSortedValue() {
    
    let newsortAllValue = newAllValue.sort( < )
    
    for var i = 0; i < Int(numberOfStock) ; i++
    {
        for var j = 0; j < newHoldingArrary.count; j++
        {
            if newsortAllValue[i] == newHoldingArrary[j].valueInDollars()
            {
                newHoldingArrary[j].printStockHolding()
                
                print("")
                
                break
            }
        }
    }
}


public func printLeastProfit() {
    
    let newsortAllProfit = newAllProfit.sort( < )
    
    for var j = 0; j < newHoldingArrary.count; j++
    {
        if newsortAllProfit[0] == newHoldingArrary[j].profitInDollars()
        {
            newHoldingArrary[j].printStockHolding()
            
            print("")
            break
        }
    }
}


public func printMostProfit() {
    
    let newsortAllProfit = newAllProfit.sort( > )
    
    for var j = 0; j < newHoldingArrary.count; j++
    {
        if newsortAllProfit[0] == newHoldingArrary[j].profitInDollars()
        {
            newHoldingArrary[j].printStockHolding()
            
            print("")
            
            break
        }
    }
}

func exit(){}

displayMenu()
