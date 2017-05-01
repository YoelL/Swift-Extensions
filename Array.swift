//
//  Array.swift
//
//  Created by Yoel Lev on 5/1/17.
//



import Foundation


extension Array where Element: Comparable {

    
    //MARK: Index Operation
    
    
    //returns middle index
    func midIndex() -> Index {
        return startIndex + (count / 2)
    }
    
    
    //MARK: - Binary Search
    
    
    /*
     binary search algorithm. Find the value at a specified index.
     note the use array slicing to adjust the upper and lower array bounds.
     returns true if the key was found in the sequence.
     */
    
    
    mutating func binarySearch(forElement key: Element) -> Bool {
        
        
        var result = false
        
        //establish indices
        let min = self.startIndex
        let max = self.endIndex - 1
        let mid = self.midIndex()
        
        
        //check bounds
        if key > self[max] || key < self[min] {
            print("search value \(key) not found..")
            return false
        }
        
        
        //evaluate chosen number..
        let n = self[mid]
        
        
        print(String(describing: n) + "value attempted..")
        
        
        if n > key {
            var slice = Array(self[min...mid - 1])
            result = slice.binarySearch(forElement: key)
        }
            
        else if n < key {
            var slice = Array(self[mid + 1...max])
            result = slice.binarySearch(forElement: key)
        }
            
        else {
            print("search value \(key) found..")
            result = true
        }
        
        return result
    }

    
    
    //MARK: - Linear Search
    
    
     /*
     linear search algorithm - use fast enumeration to iterate through a sequence
     of values. performance of O(n).
     */
    
    func linearSearch(forElement key: Element) -> Bool {
                
        //check all possible values
        for number in self {
            if number == key {
                return true
            }
        }
        
        return false
        
    }

    
  
    //MARK: - Insertion Sort
    
    
    /*
     insertion sort algorithm - rank set of random numbers lowest to highest by
     inserting numbers based on a sorted and unsorted side. performance of O(n2).
     */
   
    func insertionSort() -> Array<Element> {
        
        
        //check for trivial case
        guard self.count > 1 else {
            return self
        }
        
        
        var output: Array<Element> = self
        
        for primaryindex in 0..<output.count {
            
            let key = output[primaryindex]
            var secondaryindex = primaryindex
            
            
            while secondaryindex > -1 {
                
                print("comparing \(key) and \(output[secondaryindex])")
                
                if key < output[secondaryindex] {
                    
                    //move into correct position
                    output.remove(at: secondaryindex + 1)
                    output.insert(key, at: secondaryindex)
                }
                
                secondaryindex -= 1
            }
            
        }
        
        return output
        
    }
    
    
    
    
    //MARK: - Bubble Sort
    
    
    /*
     bubble sort algorithm - rank items from the lowest to highest by swapping
     groups of two items from left to right. The highest item in the set will bubble up to the
     right side of the set after the first iteration. performance of O(n2).
     */
    
    
    func bubbleSort() -> Array<Element> {
        
        
        //check for trivial case
        guard self.count > 1 else {
            return self
        }
        
        
        //mutated copy
        var output: Array<Element> = self
        
        
        for primaryIndex in 0..<self.count {
            
            
            let passes = (output.count - 1) - primaryIndex
            
            
            //"half-open" range operator
            for secondaryIndex in 0..<passes {
                
                let key = output[secondaryIndex]                
                
                print("comparing \(key) and \(output[secondaryIndex + 1])")
                
                //compare / swap positions
                if (key > output[secondaryIndex + 1]) {
                    swap(&output[secondaryIndex], &output[secondaryIndex + 1])
                }
            }
        }
        
        
        return output
        
    }
    
    
    
    //MARK: - Selection Sort
    
    /*
     selection sort algorithm - rank items from the lowest to highest by iterating through
     the array and swapping the current iteration with the lowest value in the rest of the array
     until it reaches the end of the array. performance of O(n2).
     */
    
    func selectionSort() -> Array<Element> {
        
        
        //check for trivial case
        guard self.count > 1 else {
            return self
        }
        
        
        //mutated copy
        var output: Array<Element> = self
        
        
        for primaryindex in 0..<output.count {
            
            
            var minimum = primaryindex
            var secondaryindex = primaryindex + 1
            
            
            while secondaryindex < output.count {
                
                print("comparing \(output[minimum]) and \(output[secondaryindex])")
                
                // store lowest value as minimum
                if output[minimum] > output[secondaryindex] {
                    minimum = secondaryindex
                }
                
                secondaryindex += 1
            }
            
            
            // swap minimum value with array iteration
            if primaryindex != minimum {
                swap(&output[primaryindex], &output[minimum])
            }
            
        }
        
        
        return output
        
    }
    
    
    
    //MARK: - Quick Sort
    
    
    /*
     quicksort algorithm - Ranks numbers through a series of swaps.
     Based on "conceptually" sorting a collection subset based on a "wall" and "pivot".
     Best case performance of O(n log(n)). Worst case performance of O(n2).
     */
    
    mutating func quickSort() -> Array<Element> {
        
        
        func qSort(start startIndex: Int, _ pivot: Int) {
            
            if (startIndex < pivot) {
                let iPivot = qPartition(start: startIndex, pivot)
                qSort(start: startIndex, iPivot - 1)
                qSort(start: iPivot + 1, pivot)
            }
        }
        
        
        qSort(start: 0, self.endIndex - 1)
        return self
        
    }
    
    
    
    //sorts collection-range based on pivot
    mutating func qPartition(start startIndex: Int, _ pivot: Int) -> Int {
        
        var wallIndex: Int = startIndex
        
        
        //compare range with pivot
        for currentIndex in wallIndex..<pivot {
            
            print("current is: \(self[currentIndex]). pivot is \(self[pivot])")
            
            if self[currentIndex] <= self[pivot] {
                if wallIndex != currentIndex {
                    swap(&self[currentIndex], &self[wallIndex])
                }
                
                //advance wall
                wallIndex += 1
            }
        }
        
        
        //move pivot to final position
        if wallIndex != pivot {
            swap(&self[wallIndex], &self[pivot])
        }
        
        return wallIndex
        
    }

    
    
}
