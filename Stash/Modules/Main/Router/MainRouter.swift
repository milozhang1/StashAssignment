//
//  MainRouter.swift
//  Stash
//
//  Created by zhangyihua on 1/13/20.
//

import Foundation
import UIKit

class MainRouter: MainRouterProtocol {
    
    class func createMainModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "MainNavigationController")
        if let view = navController.children.first as? MainViewController {
            let presenter = MainPresenter()
            let router = MainRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    
    func presentSmartInvestmentScreen(from view: MainViewProtocol) {
        let smartInvestmentViewController = SmartInvestmentRouter.createSmartInvestmentModule()
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(smartInvestmentViewController, animated: true)
        }
    }
    
}

