//
//  Int.swift
//
//  Created by Yoel Lev on 5/1/17.
//

import Foundation


extension Int {
    
    /// returns number of digits in Int number
    public var digitCount: Int {
        get {
            return numberOfDigits(in: self)
        }
    }
    /// returns number of useful digits in Int number
    public var usefulDigitCount: Int {
        get {
            var count = 0
            for digitOrder in 0..<self.digitCount {
                /// get each order digit from self
                let digit = self % (Int(pow(10, digitOrder + 1) as NSDecimalNumber))
                    / Int(pow(10, digitOrder) as NSDecimalNumber)
                if isUseful(digit) { count += 1 }
            }
            return count
        }
    }
    // private recursive method for counting digits
    private func numberOfDigits(in number: Int) -> Int {
        if abs(number) < 10 {
            return 1
        } else {
            return 1 + numberOfDigits(in: number/10)
        }
    }
    // returns true if digit is useful in respect to self
    private func isUseful(_ digit: Int) -> Bool {
        return (digit != 0) && (self % digit == 0)
    }
    
    
    
    
    //iterates the closure body a specified number of times
    func times(closure:(Int)-> Void) {
        for i in 0...self {
            closure(i)
        }
    }
    
    
    
    //build fibonacci sequence to a specified position - default
    func fibNormal() -> Array<Int>! {
        
        
        //check trivial condition
        guard self > 2 else {
            return nil
        }
        
        
        //initialize the sequence
        var sequence: Array<Int> = [0, 1]
        
        
        var i: Int = sequence.count
        
        while i != self {
            
            let results: Int = sequence[i - 1] + sequence[i - 2]
            sequence.append(results)
            
            i += 1
        }
        
        
        return sequence
        
    }
    
    
    
    //build fibonacci sequence to a specified position - recursive
    mutating func fibRecursive(_ sequence: Array<Int> = [0, 1]) -> Array<Int>! {
        
        var final = Array<Int>()
        
        
        //mutated copy
        var output = sequence

        
        //check trivial condition
        guard self > 2 else {
            return nil
        }

        
        let i: Int = output.count
        
        
        //set base condition
        if i == self {
            return output
        }
        
        
        let results: Int = output[i - 1] + output[i - 2]
        output.append(results)
        
        
        //set iteration
        final = self.fibRecursive(output)
        
        
        return final
        
    }
    

    
    //build fibonacci sequence to a specified position - trailing closure
    func fibClosure(withFormula formula: (Array<Int>) -> Int) -> Array<Int>! {
        
        
        //check trivial condition
        guard self > 2 else {
            return nil
        }
        
        
        //initialize the sequence
        var sequence: Array<Int> = [0, 1]
        
        var i: Int = sequence.count
        
        while i != self {
            
            let results: Int = formula(sequence)
            sequence.append(results)
            
            i += 1
        }
        
        
        return sequence
        
        
    } //end function
    
    
}




