//
//  EntryViewController.swift
//  node
//
//  Created by kobayashitakahiro on 2018/08/18.
//  Copyright © 2018年 kobayashitakahiro. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {

    @IBOutlet weak var demoToRegist: UIButton!
    @IBOutlet weak var demoToLogin: UIButton!
    @IBOutlet weak var demoToDeposit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // You have already registed user.
        // NO? -> transit to Regist
        
        // YES I have!
        // check deposit
        
        // you have enough deposit!!
        // transition to
        
        // you don't have
        // trantition to
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func tapRegit(_ sender: Any) {
        performSegue(withIdentifier: "showRegistViewController",sender: nil)

    }
    
    @IBAction func tapLogin(_ sender: Any) {
        performSegue(withIdentifier: "showLoginViewController",sender: nil)
    }
    
    @IBAction func tapDeposit(_ sender: Any) {
        performSegue(withIdentifier: "showDepositViewController",sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
