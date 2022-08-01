//
//  ThirdViewController.swift
//  Protocols
//
//  Created by Akın Aksoy on 1.08.2022.
//

import UIKit

class ThirdViewController: UIViewController {

    var firstDelegate : returnFromSecondPage?
    var textSecondPage : String?
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        // Do any additional setup after loading the view.
    }
    
    func configure() {
        view.addSubview(textField)
        view.addSubview(sendDataToPage1Button)
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
    }
    
    init (firstPageDelegete : returnFromSecondPage, secondPageText : String) {
        
        firstDelegate = firstPageDelegete
        textSecondPage = secondPageText
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func sendDataToFirstPage () {
        
        guard let dataText = textField.text, let secondPageText = textSecondPage else { return }
        let newText = "\(secondPageText) + \(dataText) "
        returnFirstPage(text: newText)
    }
    func returnFirstPage(text : String) {
        firstDelegate?.returnHomePage(text: text)
        navigationController?.popToRootViewController(animated: true)
    }
}
