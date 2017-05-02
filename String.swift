//
//  String.swift
// Created by Yoel Lev on 5/2/17.
//

import Foundation


extension String {
    
    
    //compute the length
    var length: Int {
        return self.characters.count
    }

    
    //formats a string to date format
    var datevalue: Date! {
      
        let stringFormatter = DateFormatter()
        stringFormatter.dateFormat = "MM-dd-yyyy"
        stringFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        //check for correct date format
        if let d = stringFormatter.date(from: self) {
            return Date(timeInterval: 0, since: d)
        }
        else {
            return nil
        }

    }
    
    
    //returns characters up to a specified integer 
    func substring(to: Int) -> String {
        
        //define the range
        let range = self.index(self.startIndex, offsetBy: to)
        return self.substring(to: range)
    }
    
    
    //replace string content
    func replace(element:String, replacement:String) -> String {
        return self.replacingOccurrences(of: element, with: replacement)
    }
    
    
    //removes empty string content
    func removingWhitespace() -> String {
        return self.replace(element: " ", replacement: "")
    }
    
    
    //convert a string into a character array
    func characters() ->Array<Character> {
        return Array(self.characters)
    }

    
    
    //reverse string order
    func reverse() -> String! {
        
        /*
         notes: While this operation would normally be done 'in-place', there are limited
         functions for manipulating native Swift strings. Even there is a
         native Array.reverse() method, this has been added as an example interview question.
         */
        
        
        //convert to array
        var characters = self.characters()
        
        var findex: Int = 0
        var bindex: Int = characters.count - 1
        
        
        while findex < bindex {
            
            //swap positions - inout parameters
            swap(&characters[findex], &characters[bindex])
            
            //update values
            findex += 1
            bindex -= 1
            
            
        } //end while
        
        
        return String(characters)
        
    }
    
    /*
     Ex:
     let str = "Test string"
     let paddedStr = str.padding(toLength: 20, withPad: " ", startingAt: 0)
     */
    //returns a padded string to the left
    func leftPadding(toLength: Int, withPad character: Character) -> String {
        let newLength = self.characters.count
        if newLength < toLength {
            return String(repeatElement(character, count: toLength - newLength)) + self
        } else {
            return self.substring(from: index(self.startIndex, offsetBy: newLength - toLength))
        }
    }
    
    
}
