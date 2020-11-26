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
  
  lazy var characterImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  lazy var quoteLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    presenter?.viewDidLoad()
  }
}

extension DetailQuotesView: DetailQuotesViewProtocol {
  func onGetImageFromURLSuccess(_ quote: String,
                                character: String, image: UIImage) {
    
    quoteLabel.text = quote
    characterImageView.image = image
    
    self.navigationItem.title = character
  }
  
  func onGetImageFromURLFailure(_ quote: String,
                                character: String) {
    
    quoteLabel.text = quote
    self.navigationItem.title = character
  }
}

extension DetailQuotesView{
  
  func setupUI(){
    
    self.view.backgroundColor = .white
    self.navigationItem.title = "Detail Quotes"
    
    self.view.addSubview(characterImageView)
    self.view.addSubview(quoteLabel)
    
    let widthHeightConstant = self.view.frame.width * 0.8
    characterImageView.translatesAutoresizingMaskIntoConstraints = false
    characterImageView.widthAnchor.constraint(equalToConstant: widthHeightConstant)
        .isActive = true
    characterImageView.heightAnchor.constraint(equalToConstant: widthHeightConstant)
        .isActive = true
    characterImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        .isActive = true
    characterImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        .isActive = true
    
    quoteLabel.translatesAutoresizingMaskIntoConstraints = false
    quoteLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        .isActive = true
    quoteLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor)
        .isActive = true
    quoteLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        .isActive = true
    
    
    
  }
  
  
  
  
}
