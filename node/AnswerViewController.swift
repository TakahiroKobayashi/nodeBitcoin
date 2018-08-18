//
//  AnswerViewController.swift
//  node
//
//  Created by kobayashitakahiro on 2018/08/15.
//  Copyright © 2018年 kobayashitakahiro. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController, ClientFirestoreDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var content: UITextView!
    @IBOutlet weak var buttonBack: UIButton!
    @IBOutlet weak var buttonAnswer: UIButton!
    @IBOutlet weak var tableAnswer: UITableView!
    public var questionid:String = ""
    
    var activityIndicatorView = UIActivityIndicatorView()

    var answer = NSMutableArray()
    var clientFirestore:ClientFirestore?

    func onError() {
        print("error")
    }
    
    func onSuccess() {
        print(answer)
        self.stopIndicator(indicator: activityIndicatorView)
        self.tableAnswer.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "aCell", for: indexPath) as! TableViewCellAnswer
        // セルに表示する値を設定する
        let dic = answer[indexPath.row] as! Dictionary<String, Any>
        //        print(String(describing: type(of: dic)))
        let content = dic["content"] as! String
        cell.textview?.text = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 79.5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(tableAnswer)
        tableAnswer.delegate = self
        tableAnswer.dataSource = self
        
        activityIndicatorView.center = view.center
        activityIndicatorView.activityIndicatorViewStyle = .whiteLarge
        activityIndicatorView.color = .gray
        self.view.addSubview(activityIndicatorView)
        
        // register cell
        self.tableAnswer.register(UINib(nibName: "TableViewCellAnswer", bundle: nil), forCellReuseIdentifier: "aCell")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        clientFirestore = ClientFirestore()
        clientFirestore?.delegate = self;
        clientFirestore?.readAnswerToQuestion(questionID: self.questionid, ret: self.answer)

        self.startIndicator(indicator: activityIndicatorView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapAnswer(_ sender: Any) {
//        let next = storyboard!.instantiateViewController(withIdentifier: "writeAnswerView") as! WriteAnswerViewController
//        self.present(next,animated: true, completion: nil)
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
