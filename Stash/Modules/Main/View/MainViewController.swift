//
//  ViewController.swift
//  Stash
//
//  Created by zhangyihua on 1/12/20.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainPresenterProtocol?

    @IBOutlet weak var investmentButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func investmentButtonTapped(_ sender: UIButton) {
        presenter?.showSmartInvestment()
    }
}

extension MainViewController: MainViewProtocol {
    
    func showSmartInvestment() {
    }
}

