//
//  WriteDiaryViewController.swift
//  Diary
//
//  Created by Taeangel, Quokka on 2022/06/15.
//

import UIKit

final class WriteDiaryViewController: UIViewController {
  lazy var baseView = WriteDiaryView(frame: view.bounds)
  private var keyboardSize: CGRect?
  
  override func loadView() {
    super.loadView()
    self.view = baseView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureUI()
    self.configureNotification()
  }
  
  private func configureUI() {
    self.view.backgroundColor = .systemBackground
    self.navigationItem.title = createTodayDate()
  }
  
  private func createTodayDate() -> String {
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "yyyy년 MM월 dd일"
    return dateformatter.string(from: Date())
  }
}

extension WriteDiaryViewController {
  private func configureNotification() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillShow),
      name: UIResponder.keyboardWillShowNotification,
      object: nil)
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillHide),
      name: UIResponder.keyboardWillHideNotification,
      object: nil)
  }
  
  private func removeNotification() {
    NotificationCenter.default.removeObserver(
      self,
      name: UIResponder.keyboardWillShowNotification,
      object: nil)
    NotificationCenter.default.removeObserver(
      self,
      name: UIResponder.keyboardWillHideNotification,
      object: nil)
  }
  
  @objc private func keyboardWillShow(_ notification: Notification) {
    guard let userInfo = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey],
          let keyboardFrame = userInfo as? CGRect else { return }
    
    let contentInset = UIEdgeInsets(
      top: .zero,
      left: .zero,
      bottom: keyboardFrame.height,
      right: .zero
    )
    
    self.baseView.textView.contentInset = contentInset
    self.baseView.textView.verticalScrollIndicatorInsets = contentInset
  }
  
  @objc private func keyboardWillHide(_ notification: Notification) {
    let contentInset = UIEdgeInsets.zero
    self.baseView.textView.contentInset = contentInset
    self.baseView.textView.scrollIndicatorInsets = contentInset
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.removeNotification()
  }
}
