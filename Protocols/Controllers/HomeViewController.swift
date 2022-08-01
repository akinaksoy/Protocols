//
//  ViewController.swift
//  Protocols
//
//  Created by Akın Aksoy on 1.08.2022.
//

import UIKit
import SnapKit
protocol returnFromSecondPage {
    
    func returnHomePage(text : String)
}


class HomeViewController: UIViewController,returnFromSecondPage {
    
    let titleLabel : UILabel = {
       var label = UILabel()
        label.font = .boldSystemFont(ofSize: 26)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var goToSecondPageButton : UIButton = {
       let button = UIButton()
        button.addTarget(self, action: #selector(goToSecondPage), for: .touchUpInside)
        button.setTitle("Go To 2 Page", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    func returnHomePage(text : String) {
        titleLabel.text = text
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
        configure()
        
    }
    
    func configure() {
        view.addSubview(titleLabel)
        view.addSubview(goToSecondPageButton)
        titleLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
        goToSecondPageButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp_bottomMargin).offset(32)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().offset(32)
            make.height.equalTo(40)
        }
    }
    
    @objc func goToSecondPage() {
        let destinationVC = SecondViewController(firstDelegete: self)
        navigationController?.pushViewController(destinationVC, animated: true)
    }

}

