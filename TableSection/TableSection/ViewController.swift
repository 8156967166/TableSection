//
//  ViewController.swift
//  TableSection
//
//  Created by Bimal@AppStation on 03/05/22.
//

import UIKit

class Appstation {
    var postName: String?
    var emplyName: [String]?
    
    
    init(postName: String, emplyName: [String]) {
        self.postName = postName
        self.emplyName = emplyName
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cmpyName = [Appstation]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        cmpyName.append(Appstation.init(postName: "IOS", emplyName: ["Amal","Kannan","Saravanan","Vishnu","Amal","Kannan","Saravanan","Vishnu"]))
        cmpyName.append(Appstation.init(postName: "Android", emplyName: ["Anil","Vishnu","Anand","Vimal"]))
        cmpyName.append(Appstation.init(postName: "React Native", emplyName: ["Sujin","Sruthi","Amal","Akhil"]))
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cmpyName.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cmpyName[section].emplyName?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cmpyName[indexPath.section].emplyName![indexPath.row]
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return cmpyName[section].postName
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        view.backgroundColor = .gray
        
        let label = UILabel(frame: CGRect(x: 125, y: 0, width: view.frame.width - 15, height: 40))
        view.addSubview(label)
        
        label.text = cmpyName[section].postName
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
}

