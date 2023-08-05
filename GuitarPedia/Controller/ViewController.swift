//
//  ViewController.swift
//  GuitarPedia
//
//  Created by Sahand Raeisi on 8/1/23.
//

import UIKit

class ViewController: UIViewController {

    var guitars: [Guitar] = [Guitar(avatar: Images.fenderTelecaster, title: "Fender", model: "Telecaster",                                     description: "This is a Fender Telecaster."),
                             Guitar(avatar: Images.gibsonLesPaul, title: "Gibson", model: "Les Paul", description: "This is a Gibson Les Paul."),
                             Guitar(avatar: Images.jacksonKingV, title: "Jackson", model: "King V", description: "This is a Jackson King V.")]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "GuitarCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guitars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! GuitarCell
        cell.avatar.image = guitars[indexPath.row].avatar
        cell.titleLabel.text = guitars[indexPath.row].title
        cell.modelLabel.text = guitars[indexPath.row].model
        cell.descriptionLabel.text = guitars[indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        guard let view = storyboard.instantiateViewController(withIdentifier: "DetailsVC") as? DetailsVC else { return }
        view.initialObject = guitars[indexPath.row]
        self.show(view, sender: nil)
    }
    
}


