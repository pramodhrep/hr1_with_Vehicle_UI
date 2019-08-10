//
//  PartTime.swift
//  hr1
//
//  Created by Marc Bueno on 2019-07-12.
//  Copyright © 2019 Marc Bueno. All rights reserved.
//

public class PartTime : Employee {

public var Rate : Int
public var NHours : Int

    

public override init() {
    Rate = 0
    NHours = 0
    super.init()
    
}

public init (_ pName: String, _ pAge: Int, _ pRate : Int, _ pHours : Int) {
    Rate = pRate
    NHours = pHours
    super.init(pName, pAge)
}
    
    public init (_ pName: String, _ pAge: Int, _ pRate : Int, _ pHours : Int, _ pV : Vehicle?) {
        Rate = pRate
        NHours = pHours
        super.init(pName, pAge, pV)
    }


public override func calcEarnings() -> Int {
    return Rate * NHours
}

} // end of class
