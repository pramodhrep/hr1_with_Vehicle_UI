//
//  Employee.swift
//  hr1
//
//  Created by Marc Bueno on 2019-06-21.
//  Copyright © 2019 Marc Bueno. All rights reserved.
//

public class Employee {
    
    // properties, attributes, instance variables, field
    public var Name : String
    public var Age : Int
    public var v : Vehicle?
    
    // constructors
    // default constructor
    public init() {
        Name = ""
        Age = 0
        v = nil
    }
    
    // non default constructor
    public init(_ pName:String, _ pAge: Int) {
        Name = pName
        Age = pAge
        v = nil
    }
    
    public init(_ pName:String, _ pAge: Int, _ pV : Vehicle?) {
        Name = pName
        Age = pAge
        v = pV
    }
   
//   destructor
//    deinit {
//        // ex. conn = nil
//    }
    
    
    // methods, bahaviour, functions
    public func calcBirthYear() -> Int {
        return 2019 - self.Age
    }
    
    public func calcEarnings() -> Int {
        return 100
    }
}
