//
//  DetailQuotesView.swift
//  VIPER-ListSimpsonQuotes
//
//  Created by Victor Hugo Benitez Bosques on 25/11/20.
//  
//

import Foundation
import UIKit

class DetailQuotesView: UIViewController {

    var presenter: DetailQuotesPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
//        presenter?.viewDidLoad()
        self.navigationItem.title = "Detail Quotes"
    }
}

extension DetailQuotesView: DetailQuotesViewProtocol {
    func getSuccesData(quote: Quote) {
        print("quotes selected", quote)
    }
    
}
