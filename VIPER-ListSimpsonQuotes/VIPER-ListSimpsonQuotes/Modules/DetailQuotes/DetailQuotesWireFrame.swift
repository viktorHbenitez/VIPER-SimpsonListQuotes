//
//  DetailQuotesWireFrame.swift
//  VIPER-ListSimpsonQuotes
//
//  Created by Victor Hugo Benitez Bosques on 25/11/20.
//  
//

import Foundation
import UIKit

class DetailQuotesWireFrame: DetailQuotesWireFrameProtocol {

    static func createDetailQuotesModule(with quotes: Quote) -> UIViewController {
        
        let viewController = DetailQuotesView()
        
        let presenter: DetailQuotesPresenterProtocol & DetailQuotesInteractorOutputProtocol = DetailQuotesPresenter()
        
        let interactor: DetailQuotesInteractorInputProtocol & DetailQuotesRemoteDataManagerOutputProtocol = DetailQuotesInteractor()
//        let localDataManager: DetailQuotesLocalDataManagerInputProtocol = DetailQuotesLocalDataManager()
//        let remoteDataManager: DetailQuotesRemoteDataManagerInputProtocol = DetailQuotesRemoteDataManager()
      
        
        viewController.presenter = presenter
        let wireFrame: DetailQuotesWireFrameProtocol = DetailQuotesWireFrame()
        
        viewController.presenter?.view = viewController
        viewController.presenter?.wireFrame = wireFrame
        viewController.presenter?.interactor = interactor
        viewController.presenter?.interactor?.quote = quotes
        viewController.presenter?.interactor?.presenter = presenter
//        presenter.view = viewController
//        presenter.wireFrame = wireFrame
//        presenter.interactor = interactor
//        presenter.interactor?.quote = quotes
//        interactor.presenter = presenter
//        interactor.localDatamanager = localDataManager
//        interactor.remoteDatamanager = remoteDataManager
//        remoteDataManager.remoteRequestHandler = interactor
        
        return viewController
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "DetailQuotesView", bundle: Bundle.main)
    }
    
}
