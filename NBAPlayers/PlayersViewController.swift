//
//  PlayersViewController.swift
//  NBAPlayers
//
//  Created by Alexandr Aniskin on 17.11.2020.
//

import UIKit

// MARK: - Class PlayersViewController
class PlayersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let players: [Player] = [
        Player(
            name: "LeBron James",
            position: "SF",
            height: "6'6''",
            team: lakers
        ),
        Player(
            name: "Anthony Davis",
            position: "PF",
            height: "7'0''",
            team: lakers
        ),
        Player(
            name: "Jimmy Buler",
            position: "SG",
            height: "6'4''",
            team: heat
        )
        
    ]
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    // MARK: - Table View - players.count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    // MARK: - Table View - return cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell", for: indexPath)
        
        let player = players[indexPath.row]
        
        cell.textLabel?.text = player.name
        cell.detailTextLabel?.text = player.team.fullName
        
        return cell
    }
    // MARK: - Table View - Player Ditails View
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let playerDitailsViewController = storyboard.instantiateViewController(identifier: "PlayerDitailsViewController") as! PlayerDitailsViewController
        
        let player = players[indexPath.row]
        
        playerDitailsViewController.player = player
        navigationController?.pushViewController(playerDitailsViewController, animated: true)
    }
    
}
