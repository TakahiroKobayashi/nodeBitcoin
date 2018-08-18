//
//  HomeViewController.swift
//  node
//
//  Created by kobayashitakahiro on 2018/08/15.
//  Copyright © 2018年 kobayashitakahiro. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, ClientFirestoreDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var allQuestion = NSMutableArray()
    var myQuestion = NSMutableArray.init()
    var clientFirestore:ClientFirestore?
    var activityIndicatorView = UIActivityIndicatorView()
    @IBOutlet weak var tableview: UITableView!
    
    func onError() {
        print("error")
    }
    
    func onSuccess() {
        print(allQuestion)
        self.stopIndicator(indicator: activityIndicatorView)
        self.tableview.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allQuestion.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "qCell", for: indexPath)
        // セルに表示する値を設定する
        let dic = allQuestion[indexPath.row] as! Dictionary<String, Any>
//        print(String(describing: type(of: dic)))
        let subject = dic["subject"] as! String
        cell.textLabel?.text = subject
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dic = allQuestion[indexPath.row] as! Dictionary<String, Any>
        let questionid = dic["id"] as! String
        let subject = dic["subject"] as! String
        let content = dic["content"] as! String
        print(questionid)
        
        let next = storyboard!.instantiateViewController(withIdentifier: "answerView") as! AnswerViewController
        self.present(next,animated: true, completion: nil)
//        self.show(next, sender: nil)
        next.questionid = dic["id"] as! String
        next.subtitle.text = subject
        next.content.text = content
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(tableview)
        tableview.delegate = self
        tableview.dataSource = self
        
        activityIndicatorView.center = view.center
        activityIndicatorView.activityIndicatorViewStyle = .whiteLarge
        activityIndicatorView.color = .gray
        self.view.addSubview(activityIndicatorView)
        
        clientFirestore = ClientFirestore()
        clientFirestore?.delegate = self;
        clientFirestore?.readAllQuestion(ret: self.allQuestion)

//        ClientFirestore.readMyQuestion(userid: "", ret: self.myQuestion)
        
       // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension UIViewController {
    func startIndicator (indicator:UIActivityIndicatorView){
        indicator.startAnimating()
        DispatchQueue.global(qos: .default).async {
            // 非同期処理などを実行
            Thread.sleep(forTimeInterval: 5)
            
            // 非同期処理などが終了したらメインスレッドでアニメーション終了
            DispatchQueue.main.async {
                // アニメーション終了
                indicator.stopAnimating()
            }
        }
    }
    
    func stopIndicator (indicator:UIActivityIndicatorView) {
        indicator.stopAnimating()
    }
}
