//
//  ViewCodeViewController.swift
//  TestBottomButton
//
//  Created by Jonathan dos Santos Gomes on 05/10/22
//

import UIKit

class ViewCodeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func loadView() {
        super.loadView()
        self.view = ViewCodeView()
    }
}
