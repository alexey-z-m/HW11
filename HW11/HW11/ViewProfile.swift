//
//  ViewProfile.swift
//  HW11
//
//  Created by Panda on 19.05.2022.
//

import Foundation
import UIKit

class ViewProfile: UIViewController {
    
    private lazy var profileStackView: UIStackView = {
        var profileStackView = UIStackView()
        
        profileStackView.axis = .vertical
        profileStackView.spacing = 10
        
        return profileStackView
    }()
    
    private lazy var infoStackView: UIStackView = {
        var infoStackView = UIStackView()
        
        infoStackView.axis = .horizontal
        infoStackView.distribution = .fill
        infoStackView.spacing = 10
        
        return infoStackView
    }()
    
    private lazy var imgAvatar: UIImageView = {
        var imgAvatar = UIImageView()
        
        let img = UIImage(named: "ava")
        imgAvatar.image = img
        imgAvatar.clipsToBounds = true
        imgAvatar.layer.cornerRadius = Metric.imgAvaHeight / 2
        
        return imgAvatar
    }()
    
    private lazy var lblStackView: UIStackView = {
        var stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var lblName: UILabel = {
        var lblName = UILabel()
        
        lblName.text = "Alexey Zablotskiy"
        lblName.font = UIFont(name: "Helvetica-Bold", size: 18)
        lblName.textColor = .white
        return lblName
    }()
    
    private lazy var lblStatus: UIButton = {
        var lblStatus = UIButton(type: .system)
        
        lblStatus.setTitle("Установить статус", for: .normal)
        lblStatus.titleLabel?.font = .systemFont(ofSize: 14 )
        let color = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        lblStatus.setTitleColor(color, for: .normal)
        lblStatus.contentHorizontalAlignment = .leading
        lblStatus.backgroundColor = #colorLiteral(red: 0.1716532707, green: 0.1766338348, blue: 0.1851372421, alpha: 0)
        return lblStatus
    }()
    
    private lazy var onlineStackView: UIStackView = {
        var stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        
        return stackView
    }()
    
    private lazy var lblOnline: UILabel = {
        var lblOnline = UILabel()
        
        let img = NSTextAttachment()
        img.image = UIImage(systemName: "iphone.homebutton")?.withTintColor(.gray)
        img.bounds = CGRect(x: 0, y: -2, width: 11, height: 14)
        let fullString = NSMutableAttributedString(string: "online ")
        fullString.append(NSAttributedString(attachment: img))
        
        lblOnline.attributedText = fullString
        lblOnline.font = .systemFont(ofSize: 14 )
        lblOnline.textColor = .gray
        
        
        return lblOnline
    }()
    
    
    private lazy var btnEdit: UIButton = {
        var btnEdit = UIButton(type: .system)
        
        btnEdit.setTitle("Редактировать", for: .normal)
        btnEdit.titleLabel?.font = .systemFont(ofSize: 15 )
        btnEdit.setTitleColor(.white, for: .normal)
        btnEdit.backgroundColor = #colorLiteral(red: 0.1716532707, green: 0.1766338348, blue: 0.1851372421, alpha: 1)
        btnEdit.layer.cornerRadius = Metric.btnEditHeight / 4
        return btnEdit
    }()
    
    private lazy var tabStackView: UIStackView = {
        var tabStackView = UIStackView()
        
        tabStackView.axis = .horizontal
        tabStackView.distribution = .equalSpacing
        tabStackView.spacing = 10
        
        return tabStackView
    }()
    
    private lazy var btnTabStory: UIButton = UIButton()
    private lazy var imgStory: UIImageView = {
        var imgStory = UIImageView()
        
        let img = UIImage(systemName: "camera")
        imgStory.image = img
        imgStory.tintColor = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        
        return imgStory
    }()
    
    private lazy var lblStory: UILabel = {
        let lbl = UILabel()
        
        lbl.text = "История"
        lbl.font = .systemFont(ofSize: 15, weight: .medium)
        lbl.textColor = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        
        return lbl
    }()
    
    private lazy var btnTabNote: UIButton = UIButton()
    private lazy var imgNote: UIImageView = {
        var imgNote = UIImageView()
        
        let img = UIImage(systemName: "square.and.pencil")
        imgNote.image = img
        imgNote.tintColor = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        
        return imgNote
    }()
    
    private lazy var lblNote: UILabel = {
        let lbl = UILabel()
        
        lbl.text = "Запись"
        lbl.font = .systemFont(ofSize: 15, weight: .medium)
        lbl.textColor = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        
        return lbl
    }()
    
    private lazy var btnTabPhoto: UIButton = {
        let btn = UIButton()
        
        btn.addTarget(self, action: #selector(action), for: .touchUpInside)
        
        return btn
    }()
    private lazy var imgPhoto: UIImageView = {
        var imgPhoto = UIImageView()
        
        let img = UIImage(systemName: "photo")
        imgPhoto.image = img
        imgPhoto.tintColor = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        
        return imgPhoto
    }()
    
    private lazy var lblPhoto: UILabel = {
        let lbl = UILabel()
        
        lbl.text = "Фото"
        lbl.font = .systemFont(ofSize: 15, weight: .medium)
        lbl.textColor = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        
        return lbl
    }()
    
    private lazy var btnTabVideo: UIButton = UIButton()
    private lazy var imgVideo: UIImageView = {
        var imgVideo = UIImageView()
        
        let img = UIImage(systemName: "play.rectangle")
        imgVideo.image = img
        imgVideo.tintColor = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        
        return imgVideo
    }()
    
    private lazy var lblVideo: UILabel = {
        let lbl = UILabel()
        
        lbl.text = "Клип"
        lbl.font = .systemFont(ofSize: 15, weight: .medium)
        lbl.textColor = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        
        return lbl
    }()
    
    private lazy var separator: UIView = {
        let separator = UIView()
        
        separator.backgroundColor = .gray
        
        return separator
    }()
    
    private lazy var mStackView: UIStackView = {
        var stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        
        return stackView
    }()
    
    private lazy var lblCity: UILabel = {
        var ibl = UILabel()
        
        let img = NSTextAttachment()
        img.image = UIImage(systemName: "house")?.withTintColor(.gray)
        img.bounds = CGRect(x: 0, y: -4, width: 25, height: 20)
        let fullString = NSMutableAttributedString(attachment: img)//
        fullString.append(NSAttributedString(string: "  Город: "))
        fullString.append(NSMutableAttributedString(string: "Архангельск"))
        
        ibl.attributedText = fullString
        ibl.font = .systemFont(ofSize: 15 )
        ibl.textColor = .gray
        
        
        return ibl
    }()
    
    private lazy var lblSubscribers: UILabel = {
        var ibl = UILabel()
        
        let img = NSTextAttachment()
        img.image = UIImage(systemName: "dot.radiowaves.up.forward")?.withTintColor(.gray)
        img.bounds = CGRect(x: 0, y: -4, width: 25, height: 20)
        let fullString = NSMutableAttributedString(attachment: img)//
        fullString.append(NSAttributedString(string: "  "))
        fullString.append(NSAttributedString(string: "35"))
        fullString.append(NSMutableAttributedString(string: " Подписчиков"))
        
        ibl.attributedText = fullString
        ibl.font = .systemFont(ofSize: 15 )
        ibl.textColor = .gray
        
        
        return ibl
    }()
    
    private lazy var btnJob: UIButton = {
        var btn = UIButton(type: .system)
        
        let color = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        
        let img = NSTextAttachment()
        img.image = UIImage(systemName: "case")?.withTintColor(color)
        img.bounds = CGRect(x: 0, y: -4, width: 25, height: 20)
        
        let fullString = NSMutableAttributedString(attachment: img)//
        fullString.append(NSAttributedString(string: "  "))
        fullString.append(NSAttributedString(string: "Указать место работы"))
        btn.titleLabel?.font = .systemFont(ofSize: 15 )
        btn.setTitleColor(color, for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.1716532707, green: 0.1766338348, blue: 0.1851372421, alpha: 0)
        btn.setAttributedTitle(fullString, for: .normal)
        return btn
    }()
    
    private lazy var btnGift: UIButton = {
        var btn = UIButton(type: .system)
        
        let color = #colorLiteral(red: 0.4450312853, green: 0.386110127, blue: 0.7607088685, alpha: 1)
        
        let img = NSTextAttachment()
        img.image = UIImage(systemName: "snowflake")?.withTintColor(color)
        img.bounds = CGRect(x: 0, y: -6, width: 25, height: 25)
        
        let fullString = NSMutableAttributedString(attachment: img)//
        fullString.append(NSAttributedString(string: "  "))
        fullString.append(NSAttributedString(string: "Получить подарок"))
        btn.titleLabel?.font = .systemFont(ofSize: 15 )
        btn.setTitleColor(color, for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.1716532707, green: 0.1766338348, blue: 0.1851372421, alpha: 0)
        btn.setAttributedTitle(fullString, for: .normal)
        return btn
    }()
    
    private lazy var btnInfo: UIButton = {
        var btn = UIButton(type: .system)
        
        let color = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        let img = NSTextAttachment()
        img.image = UIImage(systemName: "info.circle.fill")?.withTintColor(color)
        img.bounds = CGRect(x: 0, y: -6, width: 25, height: 23)
        
        let fullString = NSMutableAttributedString(attachment: img)//
        fullString.append(NSAttributedString(string: "  "))
        fullString.append(NSAttributedString(string: "Подробная информация"))
        btn.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        btn.setTitleColor(color, for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.1716532707, green: 0.1766338348, blue: 0.1851372421, alpha: 0)
        btn.setAttributedTitle(fullString, for: .normal)
        return btn
    }()
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Settings
    
    private func setupHierarchy() {
        
        view.addSubview(profileStackView)
        profileStackView.addArrangedSubview(infoStackView)
        
            infoStackView.addArrangedSubview(imgAvatar)
            infoStackView.addArrangedSubview(lblStackView)
            
                lblStackView.addArrangedSubview(lblName)
                lblStackView.addArrangedSubview(lblStatus)
                lblStackView.addArrangedSubview(onlineStackView)
            
                    onlineStackView.addArrangedSubview(lblOnline)
        profileStackView.addArrangedSubview(btnEdit)
        profileStackView.addArrangedSubview(tabStackView)
        
            tabStackView.addArrangedSubview(btnTabStory)
                btnTabStory.addSubview(imgStory)
                btnTabStory.addSubview(lblStory)
            tabStackView.addArrangedSubview(btnTabNote)
                btnTabNote.addSubview(imgNote)
                btnTabNote.addSubview(lblNote)
            tabStackView.addArrangedSubview(btnTabPhoto)
                btnTabPhoto.addSubview(lblPhoto)
                btnTabPhoto.addSubview(imgPhoto)
            tabStackView.addArrangedSubview(btnTabVideo)
                btnTabVideo.addSubview(lblVideo)
                btnTabVideo.addSubview(imgVideo)
        
        profileStackView.addSubview(separator)
        
        profileStackView.addArrangedSubview(separator)
        profileStackView.addArrangedSubview(mStackView)
            mStackView.addArrangedSubview(lblCity)
            mStackView.addArrangedSubview(lblSubscribers)
            mStackView.addArrangedSubview(btnJob)
            mStackView.addArrangedSubview(btnGift)
            mStackView.addArrangedSubview(btnInfo)
        
    }
    
    private func setupLayout() {
        profileStackView.translatesAutoresizingMaskIntoConstraints = false
        profileStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        profileStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        profileStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        imgAvatar.translatesAutoresizingMaskIntoConstraints = false
        imgAvatar.heightAnchor.constraint(equalToConstant: Metric.imgAvaHeight).isActive = true
        imgAvatar.widthAnchor.constraint(equalToConstant: Metric.imgAvaWidth).isActive = true
        
        lblName.translatesAutoresizingMaskIntoConstraints = false
        
        btnEdit.heightAnchor.constraint(equalToConstant: Metric.btnEditHeight).isActive = true
        
        //btnTabStory.translatesAutoresizingMaskIntoConstraints = false
        btnTabStory.heightAnchor.constraint(equalToConstant: Metric.imgAvaHeight).isActive = true
        btnTabStory.widthAnchor.constraint(equalToConstant: Metric.imgAvaWidth).isActive = true
        
        btnTabNote.heightAnchor.constraint(equalToConstant: Metric.imgAvaHeight).isActive = true
        btnTabNote.widthAnchor.constraint(equalToConstant: Metric.imgAvaWidth).isActive = true
        
        btnTabPhoto.heightAnchor.constraint(equalToConstant: Metric.imgAvaHeight).isActive = true
        btnTabPhoto.widthAnchor.constraint(equalToConstant: Metric.imgAvaWidth).isActive = true
        
        btnTabVideo.heightAnchor.constraint(equalToConstant: Metric.imgAvaHeight).isActive = true
        btnTabVideo.widthAnchor.constraint(equalToConstant: Metric.imgAvaWidth).isActive = true
        
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = false
        
        btnJob.titleLabel?.leadingAnchor.constraint(equalTo: btnJob.leadingAnchor).isActive = true
        btnGift.titleLabel?.leadingAnchor.constraint(equalTo: btnGift.leadingAnchor).isActive = true
        btnInfo.titleLabel?.leadingAnchor.constraint(equalTo: btnInfo.leadingAnchor).isActive = true
        
        lblPhoto.translatesAutoresizingMaskIntoConstraints = false
        lblPhoto.centerXAnchor.constraint(equalTo: btnTabPhoto.centerXAnchor).isActive = true
        lblPhoto.centerYAnchor.constraint(equalTo: btnTabPhoto.bottomAnchor, constant: -20).isActive = true
        
        imgPhoto.translatesAutoresizingMaskIntoConstraints = false
        imgPhoto.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imgPhoto.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imgPhoto.centerXAnchor.constraint(equalTo: btnTabPhoto.centerXAnchor).isActive = true
        imgPhoto.centerYAnchor.constraint(equalTo: btnTabPhoto.topAnchor, constant: 30).isActive = true
        
        lblVideo.translatesAutoresizingMaskIntoConstraints = false
        lblVideo.centerXAnchor.constraint(equalTo: btnTabVideo.centerXAnchor).isActive = true
        lblVideo.centerYAnchor.constraint(equalTo: btnTabVideo.bottomAnchor, constant: -20).isActive = true
        
        imgVideo.translatesAutoresizingMaskIntoConstraints = false
        imgVideo.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imgVideo.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imgVideo.centerXAnchor.constraint(equalTo: btnTabVideo.centerXAnchor).isActive = true
        imgVideo.centerYAnchor.constraint(equalTo: btnTabVideo.topAnchor, constant: 30).isActive = true
        
        lblStory.translatesAutoresizingMaskIntoConstraints = false
        lblStory.centerXAnchor.constraint(equalTo: btnTabStory.centerXAnchor).isActive = true
        lblStory.centerYAnchor.constraint(equalTo: btnTabStory.bottomAnchor, constant: -20).isActive = true
        
        imgStory.translatesAutoresizingMaskIntoConstraints = false
        imgStory.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imgStory.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imgStory.centerXAnchor.constraint(equalTo: btnTabStory.centerXAnchor).isActive = true
        imgStory.centerYAnchor.constraint(equalTo: btnTabStory.topAnchor, constant: 30).isActive = true
        
        lblNote.translatesAutoresizingMaskIntoConstraints = false
        lblNote.centerXAnchor.constraint(equalTo: btnTabNote.centerXAnchor).isActive = true
        lblNote.centerYAnchor.constraint(equalTo: btnTabNote.bottomAnchor, constant: -20).isActive = true
        
        imgNote.translatesAutoresizingMaskIntoConstraints = false
        imgNote.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imgNote.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imgNote.centerXAnchor.constraint(equalTo: btnTabNote.centerXAnchor).isActive = true
        imgNote.centerYAnchor.constraint(equalTo: btnTabNote.topAnchor, constant: 30).isActive = true
        
        
        
        
        
    }
    
    private func setupView() {
        view.backgroundColor = #colorLiteral(red: 0.09803896397, green: 0.0980393663, blue: 0.1066243127, alpha: 1)
    }
    
    @objc func action() {
        if view.backgroundColor == #colorLiteral(red: 0.09803896397, green: 0.0980393663, blue: 0.1066243127, alpha: 1) {
            view.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        } else {
            
            view.backgroundColor = #colorLiteral(red: 0.09803896397, green: 0.0980393663, blue: 0.1066243127, alpha: 1)
        }
       
    }
}



extension ViewProfile {
    enum Metric {
        static let imgAvaHeight: CGFloat = 80
        static let imgAvaWidth: CGFloat = 80
        
        static let btnEditHeight: CGFloat = 35
    }
    
    enum Strings {
        
    }
}


