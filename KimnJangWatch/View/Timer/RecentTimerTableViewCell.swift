//
//  RecentTimerTableViewCell.swift
//  KimnJangWatch
//
//  Created by 김승희 on 8/13/24.
//

import UIKit

import RxCocoa
import RxSwift
import SnapKit

class RecentTimerTableViewCell: UITableViewCell {
  static let id = "recentTimerCell"
  var viewModel: TimerViewModel?
  var timerId: UUID?
  private let disposeBag = DisposeBag()
  
  
  private let timeLabel: UILabel = {
    let label = UILabel()
    label.text = "00:00"
    label.font = .systemFont(ofSize: 30, weight: .semibold)
    return label
  }()
  
  private let startButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "startButton"), for: .normal)
    return button
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setCell()
    bind()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func bind() {
    // bind 메서드 작성
  }
  
  private func setCell() {
    [timeLabel, startButton].forEach { contentView.addSubview($0) }
    
    timeLabel.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().offset(10)
    }
    
    startButton.snp.makeConstraints {
      $0.trailing.equalToSuperview().offset(-10)
      $0.width.height.equalTo(50)
      $0.centerY.equalTo(timeLabel)
    }
  }
  
  func configRecentCell(timeString: String, timerId: UUID, viewModel: TimerViewModel) {
    timeLabel.text = timeString
    self.timerId = timerId
    self.viewModel = viewModel
  }
  
}
