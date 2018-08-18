//
//  Model.swift
//  node
//
//  Created by kobayashitakahiro on 2018/08/17.
//  Copyright © 2018年 kobayashitakahiro. All rights reserved.
//

import UIKit

struct User {
    var name:String
    var addr:String
    var id:String
    var image:String
}

struct Question {
    var subject:String = ""
    var content:String = ""
    var id:String = ""
}

struct Answer {
    var questionid:String
    var content:String
    var id:String
}

class Model: NSObject {
    
}
