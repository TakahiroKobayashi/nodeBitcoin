//
//  GenerateViewController.swift
//  node
//
//  Created by kobayashitakahiro on 2018/08/15.
//  Copyright © 2018年 kobayashitakahiro. All rights reserved.
//

import UIKit
import web3swift
import CryptoSwift
import BigInt
import Result
import secp256k1_ios

class GenerateViewController: UIViewController {

    @IBOutlet weak var buttonGenerate: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func buttonTapGeneratekey(_ sender: Any) {
        let random = Data.randomBytes(length: 32)!
        let encodedString = random.base64EncodedString()
        encodedString.lengthOfBytes(using: .utf8)
        print(encodedString)    // SGVsbG8sIHBsYXlncm91bmQ=
        
//        ClientFirestore.registerUser(name: "46", addr: "shibuya")
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

extension GenerateViewController {
    
}
