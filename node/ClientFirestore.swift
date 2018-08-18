//
//  ClientFirestore.swift
//  node
//
//  Created by kobayashitakahiro on 2018/08/17.
//  Copyright © 2018年 kobayashitakahiro. All rights reserved.
//

import UIKit
import FirebaseFirestore

protocol ClientFirestoreDelegate {
    
    func onError() -> Void
    func onSuccess() -> Void
}

class ClientFirestore: NSObject {
//    weak var delegate: ClientFirestoreDelegate?
    var delegate: ClientFirestoreDelegate?

    func writeUser (name: String, addr: String) -> Void {
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        let randomdata = Data.randomBytes(length: 32)!
        let encodedString = randomdata.base64EncodedString()
        ref = db.collection("users").addDocument(data: [
            "name": name,
            "addr": addr,
            "id": encodedString
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    func writeQuestion (subject: String, content: String, byUser: String) -> Void {
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        let randomdata = Data.randomBytes(length: 32)!
        let encodedString = randomdata.base64EncodedString()
        ref = db.collection("question").addDocument(data: [
            "subject": subject,
            "content": content,
            "id": encodedString,
            "userid": byUser
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
                self.delegate?.onError()
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    func readAllQuestion(ret:NSMutableArray){
        let db = Firestore.firestore()
        db.collection("question").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                self.delegate?.onError()
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    ret.add(document.data())
                }
                self.delegate?.onSuccess()
            }
        }
    }
    
    func readMyQuestion(userid:String, ret:NSMutableArray) {
        let db = Firestore.firestore()
        db.collection("question").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                self.delegate?.onError()
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    ret.add(document.data())
                }
            }
        }
    }
    
    func readAnswerToQuestion(questionID: String, ret: NSMutableArray) {
        let db = Firestore.firestore()
        db.collection("answer").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                self.delegate?.onError()
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    let data = document.data()
                    if data["questionid"] as! String == questionID {
                        ret.add(data)
                    }
                }
                self.delegate?.onSuccess()
            }
        }
    }
    
    func writeAnswer (questionid: String, content: String, byUser: String) -> Void {
        let db = Firestore.firestore()
        var ref: DocumentReference? = nil
        let randomdata = Data.randomBytes(length: 32)!
        let encodedString = randomdata.base64EncodedString()
        ref = db.collection("answer").addDocument(data: [
            "content": content,
            "questionid": questionid,
            "userid": byUser,
            "id": encodedString
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
}
