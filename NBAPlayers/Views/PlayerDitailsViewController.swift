//
//  PlayerDitailsViewController.swift
//  NBAPlayers
//
//  Created by Alexandr Aniskin on 17.11.2020.
//

import UIKit

class PlayerDitailsViewController: UIViewController {

    @IBOutlet weak var posotionLable: UILabel!
    @IBOutlet weak var heightLable: UILabel!
    @IBOutlet weak var teamButton: UIButton!
    
    var player: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = player?.name
        posotionLable.text = player?.position
        heightLable.text = player?.height
        teamButton.setTitle(player?.team.fullName, for: .normal)
    }
    
    @IBAction func onTeamButtonTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let teamDitailsViewController = storyboard.instantiateViewController(identifier: "TeamDitailsViewController") as! TeamDitailsViewController
        
        teamDitailsViewController.team = player?.team
        
        navigationController?.pushViewController(teamDitailsViewController, animated: true)
    }
    
}
