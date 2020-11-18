//
//  TeamDitailsViewController.swift
//  NBAPlayers
//
//  Created by Alexandr Aniskin on 17.11.2020.
//

import UIKit

// MARK: - Class TeamDitailsViewController
class TeamDitailsViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var conferenceLabel: UILabel!
    
    var team: Team?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = team?.name
        cityLabel.text = team?.city
        conferenceLabel.text = team?.conference
    }
    
}
