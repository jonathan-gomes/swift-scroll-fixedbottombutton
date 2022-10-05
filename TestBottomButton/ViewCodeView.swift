//
//  ViewCodeView.swift
//  TestBottomButton
//
//  Created by Jonathan dos Santos Gomes on 05/10/22
//

import UIKit

class ViewCodeView: UIView {
    // MARK: - view elements
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var scrollContentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var textView: UITextView = {
        let view = UITextView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled = false
        view.textColor = .systemGray
        view.text = Self.text
        return view
    }()
    lazy var button: UIButton = {
        let view = UIButton(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Change text", for: .normal)
        view.configuration = UIButton.Configuration.filled()
        return view
    }()
    
    // MARK: - properties
    var textToggle = false
    
    // MARK: init
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupViewCodeElements()
        setupConstraints()
        
        button.addTarget(
            self,
            action: #selector(changeText),
            for: .touchUpInside)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func changeText() {
        textView.text = textToggle ? Self.text : Self.largeText
        textToggle.toggle()
    }
    
    // MARK: setup view hierarchy
    func setupViewCodeElements() {
        addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        scrollContentView.addSubview(textView)
        scrollContentView.addSubview(button)
    }
    
    // MARK: contraints setup
    func setupConstraints() {
        setupScrollViewConstraints()
        setupScrollContentViewConstraints()
        applyTextViewConstraints()
        setupBackButtonConstraints()
    }
    
    func setupScrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor
                .constraint(equalTo: leadingAnchor),
            scrollView.topAnchor
                .constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.trailingAnchor
                .constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor
                .constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupScrollContentViewConstraints() {
        let scrollContentViewBottomAnchor = scrollContentView.bottomAnchor
            .constraint(equalTo: scrollView.bottomAnchor)
        scrollContentViewBottomAnchor.priority = .defaultLow
        
        let scrollContentViewCenterYAnchor = scrollContentView.centerYAnchor
            .constraint(equalTo: scrollView.centerYAnchor)
        scrollContentViewCenterYAnchor.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            scrollContentView.leadingAnchor
                .constraint(equalTo: scrollView.leadingAnchor),
            scrollContentView.topAnchor
                .constraint(equalTo: scrollView.topAnchor),
            scrollContentView.trailingAnchor
                .constraint(equalTo: scrollView.trailingAnchor),
            scrollContentViewBottomAnchor,
            scrollContentView.centerXAnchor
                .constraint(equalTo: scrollView.centerXAnchor),
            scrollContentViewCenterYAnchor
        ])
    }
    
    func applyTextViewConstraints() {
        NSLayoutConstraint.activate([
            textView.topAnchor
                .constraint(equalTo: scrollContentView.topAnchor),
            textView.leadingAnchor
                .constraint(equalTo: scrollContentView.leadingAnchor,
                            constant: 16),
            textView.trailingAnchor
                .constraint(equalTo: scrollContentView.trailingAnchor,
                            constant: -16),
            textView.bottomAnchor
                .constraint(equalTo: button.topAnchor,
                            constant: -24)
        ])
    }
    
    func setupBackButtonConstraints() {
        let buttonBottomAnchor = button.bottomAnchor
            .constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,
                        constant: -24)
        buttonBottomAnchor.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 48),
            button.leadingAnchor
                .constraint(equalTo: scrollContentView.leadingAnchor,
                            constant: 16),
            button.trailingAnchor
                .constraint(equalTo: scrollContentView.trailingAnchor,
                            constant: -16),
            button.bottomAnchor
                .constraint(equalTo: scrollContentView.bottomAnchor,
                            constant: -24),
            buttonBottomAnchor
        ])
    }
    // MARK: String constants
    static let text = """
Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
"""
    
    static let largeText = """
Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.
"""
}
