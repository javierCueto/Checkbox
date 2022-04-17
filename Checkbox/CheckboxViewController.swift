//
//  CheckboxViewController.swift
//  Checkbox
//
//  Created by Javier Cueto on 16/04/22.
//

import UIKit
import Combine

final class CheckboxViewController: UIViewController {
    
    private var store = Set<AnyCancellable>()
    
    private let checkbox: Checkbox = {
        let viewModel = CheckboxViewModel(identifier: "Checkbox 0", description: "Subscribe o un like", type: .squareCheckmarkFill)
        let checkbox = Checkbox(viewModel: viewModel)
        return checkbox
    }()
    
    private let containerCheckboxesStackView: UIStackView  = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    private let container2CheckboxesStackView: UIStackView  = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        title = "Checkbox"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(checkbox)
        
        checkbox.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 20).isActive = true
        
        checkbox.leftAnchor.constraint(
            equalTo: view.leftAnchor,
            constant: 20).isActive = true
        
        checkbox.rightAnchor.constraint(
            equalTo: view.rightAnchor,
            constant: -20).isActive = true
        
        view.addSubview(containerCheckboxesStackView)
        containerCheckboxesStackView.topAnchor.constraint(
            equalTo: checkbox.bottomAnchor,
            constant: 20).isActive = true
        
        containerCheckboxesStackView.leftAnchor.constraint(
            equalTo: view.leftAnchor,
            constant: 20).isActive = true
        
        containerCheckboxesStackView.rightAnchor.constraint(
            equalTo: view.rightAnchor,
            constant: -20).isActive = true
        
        view.addSubview(container2CheckboxesStackView)
        container2CheckboxesStackView.topAnchor.constraint(
            equalTo: containerCheckboxesStackView.bottomAnchor,
            constant: 20).isActive = true
        
        container2CheckboxesStackView.leftAnchor.constraint(
            equalTo: view.leftAnchor,
            constant: 20).isActive = true
        
        container2CheckboxesStackView.rightAnchor.constraint(
            equalTo: view.rightAnchor,
            constant: -20).isActive = true
        
        
        for index in 1...5 {
            let checkbox: Checkbox = {
                let viewModel = CheckboxViewModel(identifier: "Checkbox \(index)", description: "Checkbox en Stack View \(index)", type: .square)
                let checkbox = Checkbox(viewModel: viewModel)
                checkbox.setTintColor(color: .purple)
                return checkbox
            }()
            subscriptions(checkbox: checkbox)
            containerCheckboxesStackView.addArrangedSubview(checkbox)
        }
        
        for index in 1...5 {
            let checkbox: Checkbox = {
                let viewModel = CheckboxViewModel(identifier: "Checkbox \(index)", description: "Checkbox en Stack View \(index)", type: .circleCheckMark)
                let checkbox = Checkbox(viewModel: viewModel)
                checkbox.setTintColor(color: .red)
                return checkbox
            }()
            subscriptions(checkbox: checkbox)
            container2CheckboxesStackView.addArrangedSubview(checkbox)
        }
        
        subscriptions(checkbox: checkbox)
        
    }
    
    private func subscriptions(checkbox: Checkbox) {
        checkbox.viewModelObserver.sink { checkboxViewModel in
            print(checkboxViewModel)
        }.store(in: &store)
    }
    
    
    
}

