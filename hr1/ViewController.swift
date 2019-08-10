//
//  ViewController.swift
//  hr1
//
//  Created by Marc Bueno on 2019-06-21.
//  Copyright © 2019 Marc Bueno. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var aEmp : [Employee] = []
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtHours: UITextField!
    @IBOutlet weak var txtRate: UITextField!
    
    
    @IBOutlet weak var txtStatus: UILabel!
    
    @IBOutlet weak var txtList: UITextView!
    @IBOutlet weak var txtAge: UITextField!
    
    @IBOutlet weak var txtSalary: UITextField!
    
    
    @IBOutlet weak var txtBonus: UITextField!
    
    @IBOutlet weak var txtMake: UITextField!
    
    @IBOutlet weak var txtModel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAdd(_ sender: UIButton) {
       
        var ft1 : FullTime
        var pt1 : PartTime
        
        var tempVehicle : Vehicle?
        
        if (txtMake.text! == "" && txtModel.text! == "") {
            tempVehicle = nil
        } else {
            tempVehicle = Vehicle()
            tempVehicle?.make = txtMake.text!
            tempVehicle?.model = txtModel.text!
        }

        
        if txtSalary.text! == "" && txtBonus.text! == "" {
            
                pt1 = PartTime(txtName.text!, Int(txtAge.text!)!, Int(txtRate.text!)!, Int(txtHours.text!)!, tempVehicle) // non-default constructor

            aEmp.append(pt1)
        }
        
        if txtRate.text! == "" && txtHours.text! == "" {
            // this is a FullTime - create a full time object
            
            ft1 = FullTime(txtName.text!, Int(txtAge.text!)!, Int(txtSalary.text!)!, Int(txtBonus.text!)!, tempVehicle) // non-default constructor
            aEmp.append(ft1)
            
            
        }
        
        
        
        txtStatus.text = "Employee Added"
        
        
    }
    
    @IBAction func btnList(_ sender: UIButton) {
        txtList.text = ""
        
        var earn = 0;
        var totalPayroll = 0;
        
        
        
        for i in aEmp {
            
            // calcEarning is polymorphic
            var earn = i.calcEarnings();
            totalPayroll = totalPayroll + earn;
            
            if i is FullTime {
                
                var ft1 : FullTime = (i as! FullTime)
                var str = " Name: \(ft1.Name) Age: \(ft1.Age) Sal: \(ft1.Salary) bonus: \(ft1.Bonus) earn: \(earn) "
                if((i.v?.make ?? "").isEmpty && (i.v?.model ?? "").isEmpty){
                    str += " *** employee has no vehicle registered *** \n"
                }else{
                    str += " Vehicle Make: \(ft1.v?.make ?? "nil") Vehicle Model: \(ft1.v?.model ?? "nil") \n"
                }
                txtList.text += str
                // print (i.Name + String(i.Age))
            }
            
            if i is PartTime {
                var pt1 : PartTime = (i as! PartTime)
                var str = "Name: \(pt1.Name) Age: \(pt1.Age) Rate: \(pt1.Rate) Hours: \(pt1.NHours) earn: \(earn)\n "
                if((i.v?.make ?? "").isEmpty && (i.v?.model ?? "").isEmpty){
                    str += " *** employee has no vehicle registered *** \n"
                }else{
                    str += " Vehicle Make: \(pt1.v?.make ?? "nil") Vehicle Model: \(pt1.v?.model ?? "nil") \n"
                }
                txtList.text += str
            }
        
        }
        txtList.text += "***** Total Payroll \(totalPayroll) ******* \n"
        print ("***** Total Payroll \(totalPayroll) ******* ")
        
    }
    
    @IBAction func btnSearch(_ sender: UIButton) {
        
        var tSearch : String
        var found : Bool = false
        
        tSearch = txtName.text!
        
        for i in aEmp {
            if i.Name == tSearch {
                // employee found
                txtAge.text = String(i.Age)
                found = true
                break
            }
        }
        
        if found {
            txtStatus.text = "Employee Found"
        } else {
            txtStatus.text = "Employee NOT Found"
        }
        
        
        
        
        
    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        
        txtName.text = ""
        txtAge.text = ""
        txtStatus.text = ""
        txtList.text = ""
        txtSalary.text = ""
        txtBonus.text = ""
        txtModel.text = ""
        txtMake.text = ""
        
    }
    
    
}

