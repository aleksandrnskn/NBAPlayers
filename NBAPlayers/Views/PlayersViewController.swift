//
//  PlayersViewController.swift
//  NBAPlayers
//
//  Created by Alexandr Aniskin on 17.11.2020.
//

import UIKit

// MARK: - Class PlayersViewController
class PlayersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var reloadButton: UIButton!
    
    var players: [Player] = []
    let apiClient: ApiClient = ApiClientImpl()
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        reloadData()
    }
    
    // MARK: - Show Loading
    func showLoading() {
        activityIndicatorView.startAnimating()
        errorLabel.isHidden = true
        reloadButton.isHidden = true
    }
    
    // MARK: - Show Data
    func showData() {
        activityIndicatorView.stopAnimating()
        errorLabel.isHidden = true
        reloadButton.isHidden = true
    }
    
    // MARK: - Show Error
    func showError() {
        activityIndicatorView.stopAnimating()
        errorLabel.isHidden = false
        reloadButton.isHidden = false
    }
    
    // MARK: - Get Players
    func reloadData() {
        showLoading()
        apiClient.getPlayers(onResult: { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let players):
                    self.players = players
                    self.tableView.reloadData()
                    self.showData()
                case .failure:
                    self.players = []
                    self.tableView.reloadData()
                    self.showError()
                }
                self.activityIndicatorView.stopAnimating()
            }
        })
    }
    
    @IBAction func onReloadButtonTap(_ sender: Any) {
        reloadData()
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
