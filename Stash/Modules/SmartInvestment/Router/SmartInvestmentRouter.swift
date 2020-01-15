//
//  SmartInvestmentRouter.swift
//  Stash
//
//  Created by zhangyihua on 1/13/20.
//

import UIKit

class SmartInvestmentRouter: SmartInvestmentRouterProtocol {
    
    class func createSmartInvestmentModule() -> UIViewController {
        
        
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SmartInvestmentViewController")

        if let view = viewController as? SmartInvestmentViewController {
            let presenter = SmartInvestmentPresenter()
            let interactor = SmartInvestmentInteractor()
            let localDataManager = SmartInvestmentLocalDataManager()
            let router: SmartInvestmentRouterProtocol = SmartInvestmentRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager

            return view
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
        
}

