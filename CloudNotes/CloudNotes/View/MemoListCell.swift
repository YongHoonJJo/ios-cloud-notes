//
//  MemoListCell.swift
//  CloudNotes
//
//  Created by 기원우 on 2021/06/01.
//

import UIKit

class MemoListCell: UITableViewCell {
    static let identifier = "MemoListTableViewCell"
    private var memoListCellModel = MemoListCellModel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default , reuseIdentifier: MemoListCell.identifier)
        
        self.configureCellConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been impl")
    }
    
    private var title: UILabel = {
        let title = UILabel()
        title.text = "title Text"
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = UIFont.boldSystemFont(ofSize: 24)
        
        return title
    }()
    
    private var body: UILabel = {
        let body = UILabel()
        body.text = "body Text"
        body.translatesAutoresizingMaskIntoConstraints = false
        body.font = UIFont.systemFont(ofSize: 15)
        body.textColor = .gray
        
        return body
    }()
    
    
    private var lastModified: UILabel = {
        let lastModified = UILabel()
        lastModified.text = "lastModified Text"
        lastModified.translatesAutoresizingMaskIntoConstraints = false
        lastModified.font = UIFont.systemFont(ofSize: 15)
        
        return lastModified
    }()
    
    private func configureCellConstraints() {
        let margins = contentView.layoutMarginsGuide
        
        contentView.addSubview(title)
        contentView.addSubview(body)
        contentView.addSubview(lastModified)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: margins.topAnchor),
            title.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 3),
            title.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0),
            
            lastModified.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 0),
            lastModified.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            lastModified.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 3),
            
            body.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 0),
            body.bottomAnchor.constraint(equalTo: margins.bottomAnchor),
            body.leadingAnchor.constraint(equalTo: lastModified.trailingAnchor, constant: 20),
            body.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0)
        ])
    }
    
    func configureCell(data: Memo) {
        title.text = data.title
        body.text = data.body
        lastModified.text = memoListCellModel.convertDate(date: data.lastModified)
    }
    
    
}
