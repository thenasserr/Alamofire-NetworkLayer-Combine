//
//  ViewController.swift
//  Alamofire-NetworkLayer-Combine
//
//  Created by Ibrahim Nasser Ibrahim on 06/01/2024.
//

import UIKit

class ViewController: UIViewController {

  let viewModel = HomeViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    viewModel.getCategories()
  }


}

