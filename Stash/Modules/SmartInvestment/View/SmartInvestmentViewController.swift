//
//  SmartInvestmentViewController.swift
//  Stash
//
//  Created by zhangyihua on 1/13/20.
//

import UIKit

class SmartInvestmentViewController: UIViewController {

    @IBOutlet weak var investmentTableView: UITableView!
    var presenter: SmartInvestmentPresenterProtocol?
    var achievements: [Achievement] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        investmentTableView.tableFooterView = UIView()
        navigationItem.title = "Smart Investing"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: nil, action: nil)
        }
}

extension SmartInvestmentViewController: SmartInvestmentViewProtocol {
    func showAchievements(achievements: [Achievement]) {
        self.achievements = achievements
        investmentTableView.reloadData()
    }
    
    func showError() {
    }
    
    func showLoading() {
    }
    
    func hideLoading() {
    }
}

extension SmartInvestmentViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        achievements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SmartInvestmentIdentifier", for: indexPath) as! SmartInvestmentTableViewCell
        let achievement = achievements[indexPath.row]
        cell.setAchievement(achievement: achievement)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.main.bounds.width / 10 * 7
    }
}
