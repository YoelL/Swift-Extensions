//
//  Sortable.swift
//
//  Created by Yoel Lev on 5/1/17.
//

import Foundation


//note: an extension on a protocol

extension Sortable {
    
    
    func isSorted<T: Comparable>(_ sequence: Array<T>) -> Bool {
        
        
        //check trivial cases 
        guard sequence.count <= 1 else {
            return true
        }
        
        var index = sequence.startIndex
        
        
        //compare sequence values
        while index < sequence.endIndex - 1 {
            if sequence[index] > sequence[sequence.index(after: index)] {
                return false
            }
            index = sequence.index(after: index)
        }
        
        return true
        
    }
    
        
}
