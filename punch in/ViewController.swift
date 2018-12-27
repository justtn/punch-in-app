//
//  ViewController.swift
//  punch in
//
//  Created by localadmin on 27/12/18.
//  Copyright © 2018 justin. All rights reserved.
//

import UIKit

class Person {
    let name: String
    var state: CellState
    
    init(name: String, state: CellState) {
        self.name = name
        self.state = state
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    

    var persons: [Person]!
//
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        topView.layer.borderColor = UIColor.red.cgColor
//        topView.layer.borderWidth = 3.0
        
        topView.layer.shadowOpacity = 0.3
        topView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        topView.layer.shadowRadius = 1.5

            persons = [Person(name: "Ram", state: .unknown),
                           Person(name: "Shyam", state: .unknown),
                           Person(name: "Balram", state: .unknown),
                           Person(name: "Nancy", state: .unknown),
                           Person(name: "James", state: .unknown),
                           Person(name: "Tony", state: .unknown),
                           Person(name: "Kevin", state: .unknown),
                           Person(name: "Thomas", state: .unknown),
                           Person(name: "George", state: .unknown),
                           Person(name: "Sumesh", state: .unknown),
                           Person(name: "Ramesh", state: .unknown),
                           Person(name: "Suresh", state: .unknown),
                           Person(name: "Charles", state: .unknown),
                           Person(name: "David", state: .unknown),
                           ]
    }


}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CheckMarkCell.identifier, for: indexPath) as! CheckMarkCell
        cell.configure(person: persons[indexPath.row])
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedPerson = persons[indexPath.row]
        switch selectedPerson.state {
        case .unknown:
            selectedPerson.state = .checkedin
        case .checkedin:
            selectedPerson.state = .checkedout
        case .checkedout:
            selectedPerson.state = .unknown
//        default:
//            print("any other weird case")
        }
        tableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.none)
        
        
    }
    
//    func updateCell(of person: Person) {
//
//
//    }
    
}
