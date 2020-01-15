//
//  SmartInvestmentProtocols.swift
//  Stash
//
//  Created by zhangyihua on 1/13/20.
//

import Foundation
import UIKit

protocol SmartInvestmentViewProtocol: AnyObject {
    var presenter: SmartInvestmentPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showAchievements(achievements: [Achievement])
    func showError()
    func showLoading()
    func hideLoading()
}

protocol SmartInvestmentRouterProtocol: AnyObject {
    static func createSmartInvestmentModule() -> UIViewController
}

protocol SmartInvestmentPresenterProtocol: AnyObject {
    var view: SmartInvestmentViewProtocol? { get set }
    var interactor: SmartInvestmentInteractorInputProtocol? { get set }
    var router: SmartInvestmentRouterProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
}

protocol SmartInvestmentInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func didRetrieveAchievements(_ achievements: [Achievement])
    func onError()
}

protocol SmartInvestmentInteractorInputProtocol: AnyObject {
    var presenter: SmartInvestmentInteractorOutputProtocol? { get set }
    var localDatamanager: SmartInvestmentLocalDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveSmartInvestment()
}

protocol SmartInvestmentLocalDataManagerInputProtocol: AnyObject {
     // INTERACTOR -> LOCALDATAMANAGER
    func retrieveSmartInvestment() throws -> [Achievement]
}
