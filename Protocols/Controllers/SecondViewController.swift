//
//  SecondViewController.swift
//  Protocols
//
//  Created by Akın Aksoy on 1.08.2022.
//

import UIKit

class SecondViewController: UIViewController {

    
    var firstPageDelegete : returnFromSecondPage?
    
    var textField : UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var sendDataToPage1Button : UIButton = {
       let button = UIButton()
        button.addTarget(self, action: #selector(sendDataToFirstPage), for: .touchUpInside)
        button.setTitle("Send Data To Page 1", for: .normal)
        button.backgroundColor = .yellow
        return button
    }()
    lazy var sendDataToPage3Button : UIButton = {
       let button = UIButton()
        button.addTarget(self, action: #selector(sendDataToThirdPage), for: .touchUpInside)
        button.setTitle("Send Data To Page 3", for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        // Do any additional setup after loading the view.
    }
    
    func configure() {
        
        view.addSubview(textField)
        view.addSubview(sendDataToPage1Button)
        view.addSubview(sendDataToPage3Button)
        textField.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        sendDataToPage1Button.snp.makeConstraints { make in
            make.top.equalTo(textField.snp_bottomMargin).offset(16)
            make.width.equalTo(textField)
            make.height.equalTo(50)
        }
        sendDataToPage3Button.snp.makeConstraints { make in
            make.top.equalTo(sendDataToPage1Button.snp_bottomMargin).offset(16)
            make.width.equalTo(sendDataToPage1Button)
            make.height.equalTo(50)
        }
    }
    init(firstDelegete : returnFromSecondPage) {
        firstPageDelegete = firstDelegete
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func sendDataToFirstPage () {
        
        guard let dataText = textField.text else { return }
        returnFirstPage(text: dataText)
    }
    
    @objc func sendDataToThirdPage() {
        guard let dataText = textField.text , let delegate = firstPageDelegete else { return }
        
        navigateThirdPage(text: dataText, delegate: delegate)
    }
    
    func returnFirstPage(text : String) {
        firstPageDelegete?.returnHomePage(text: text)
        navigationController?.popViewController(animated: true)
    }
    func navigateThirdPage(text : String , delegate : returnFromSecondPage) {
        let destinationVC = ThirdViewController(firstPageDelegete: delegate, secondPageText: text)
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
}
