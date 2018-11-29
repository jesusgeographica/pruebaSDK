//
//  MenuViewController.swift
//  TempoExample
//
//  Created by Jesus Victorio on 27/11/2018.
//  Copyright © 2018 Geographica. All rights reserved.
//

import UIKit
import Tempo_ios_sdk

class MenuViewController: UIViewController {

    weak var centerUpdateDelegate: CenterUpdateDelegate?
    
    @IBOutlet weak var tableviewMenu: UITableView!
    var dataECI : [String] = ["Castellana", "Goya", "Duque"]
    var dataECICodes : [String] = ["205", "207", "241"]
    let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableviewMenu.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        tableviewMenu.delegate = self
        tableviewMenu.dataSource = self
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MenuViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.centerUpdateDelegate?.centerUpdate(didUpdateCenter: dataECICodes[indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }
}

extension MenuViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataECI.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        cell.textLabel?.text = dataECI[indexPath.row]
        
        return cell
    }
}

protocol CenterUpdateDelegate: class {
    func centerUpdate(didUpdateCenter center_id: String)
}
