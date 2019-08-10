//
//  FullTime.swift
//  hr1
//
//  Created by Marc Bueno on 2019-07-05.
//  Copyright © 2019 Marc Bueno. All rights reserved.
//

public class FullTime : Employee {
    
    public var Salary : Int
    public var Bonus : Int
    
    public override init() {
        Salary = 0
        Bonus = 0
        super.init()
    }
    
    public init (_ pName: String, _ pAge: Int, _ pSalary : Int, _ pBonus : Int) {
        Salary = pSalary
        Bonus = pBonus
        super.init(pName, pAge)
    }
    
    public init (_ pName: String, _ pAge: Int, _ pSalary : Int, _ pBonus : Int,_ pV: Vehicle?) {
        Salary = pSalary
        Bonus = pBonus
        super.init(pName, pAge, pV)
    }
    
    
    public override func calcEarnings() -> Int {
        return Salary + Bonus
    }
    
    
} // end of class


