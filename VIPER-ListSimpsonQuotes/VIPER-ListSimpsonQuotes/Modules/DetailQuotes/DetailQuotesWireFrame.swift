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
    
    let remoteDatamanager: DetailQuotesRemoteDataManagerInputProtocol = DetailQuotesRemoteDataManager()
    viewController.presenter = presenter
    viewController.presenter?.wireFrame = DetailQuotesWireFrame()
    viewController.presenter?.view = viewController
    
    viewController.presenter?.interactor = interactor
    viewController.presenter?.interactor?.quote = quotes
    viewController.presenter?.interactor?.presenter = presenter
    viewController.presenter?.interactor?.remoteDatamanager = remoteDatamanager
    
    return viewController
  }
  
  
}
