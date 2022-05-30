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
    
    private lazy var imageAvatar: UIImageView = {
        var imageAvatar = UIImageView()
        
        let image = UIImage(named: "ava")
        imageAvatar.image = image
        imageAvatar.clipsToBounds = true
        imageAvatar.layer.cornerRadius = Metric.imgAvaHeight / 2
        
        return imageAvatar
    }()
    
    private lazy var labelStackView: UIStackView = {
        var stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var labelName: UILabel = {
        var labelName = UILabel()
        
        labelName.text = "Alexey Zablotskiy"
        labelName.font = UIFont(name: "Helvetica-Bold", size: 18)
        labelName.textColor = .white
        return labelName
    }()
    
    private lazy var labelStatus: UIButton = {
        var labelStatus = UIButton(type: .system)
        
        labelStatus.setTitle("Установить статус", for: .normal)
        labelStatus.titleLabel?.font = .systemFont(ofSize: 14 )
        let color = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        labelStatus.setTitleColor(color, for: .normal)
        labelStatus.contentHorizontalAlignment = .leading
        labelStatus.backgroundColor = #colorLiteral(red: 0.1716532707, green: 0.1766338348, blue: 0.1851372421, alpha: 0)
        return labelStatus
    }()
    
    private lazy var onlineStackView: UIStackView = {
        var stackView = UIStackView()
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10
        
        return stackView
    }()
    
    private lazy var labelOnline: UILabel = {
        var labelOnline = UILabel()
        
        let imagePhone = NSTextAttachment()
        imagePhone.image = UIImage(systemName: "iphone.homebutton")?.withTintColor(.gray)
        imagePhone.bounds = CGRect(x: 0, y: -2, width: 11, height: 14)
        let fullString = NSMutableAttributedString(string: "online ")
        fullString.append(NSAttributedString(attachment: imagePhone))
        
        labelOnline.attributedText = fullString
        labelOnline.font = .systemFont(ofSize: 14 )
        labelOnline.textColor = .gray
        
        
        return labelOnline
    }()
    
    
    private lazy var buttonEdit: UIButton = {
        var buttonEdit = UIButton(type: .system)
        
        buttonEdit.setTitle("Редактировать", for: .normal)
        buttonEdit.titleLabel?.font = .systemFont(ofSize: 15 )
        buttonEdit.setTitleColor(.white, for: .normal)
        buttonEdit.backgroundColor = #colorLiteral(red: 0.1716532707, green: 0.1766338348, blue: 0.1851372421, alpha: 1)
        buttonEdit.layer.cornerRadius = Metric.btnEditHeight / 4
        return buttonEdit
    }()
    
    private lazy var tabStackView: UIStackView = {
        var tabStackView = UIStackView()
        
        tabStackView.axis = .horizontal
        tabStackView.distribution = .equalSpacing
        tabStackView.spacing = 10
        
        return tabStackView
    }()
    
    private lazy var buttonTabStory: UIButton = UIButton()
    private lazy var imageStory: UIImageView = {
        var imageStory = UIImageView()
        
        let imageCamera = UIImage(systemName: "camera")
        imageStory.image = imageCamera
        imageStory.tintColor = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        
        return imageStory
    }()
    
    private lazy var labelStory: UILabel = {
        let label = UILabel()
        
        label.text = "История"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        
        return label
    }()
    
    private lazy var buttonTabNote: UIButton = UIButton()
    private lazy var imageNote: UIImageView = {
        var imageNote = UIImageView()
        
        let image = UIImage(systemName: "square.and.pencil")
        imageNote.image = image
        imageNote.tintColor = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        
        return imageNote
    }()
    
    private lazy var labelNote: UILabel = {
        let label = UILabel()
        
        label.text = "Запись"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        
        return label
    }()
    
    private lazy var buttonTabPhoto: UIButton = {
        let button = UIButton()
        
        button.addTarget(self, action: #selector(action), for: .touchUpInside)
        
        return button
    }()
    private lazy var imagePhoto: UIImageView = {
        var imagePhoto = UIImageView()
        
        let image = UIImage(systemName: "photo")
        imagePhoto.image = image
        imagePhoto.tintColor = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        
        return imagePhoto
    }()
    
    private lazy var labelPhoto: UILabel = {
        let label = UILabel()
        
        label.text = "Фото"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        
        return label
    }()
    
    private lazy var buttonTabVideo: UIButton = UIButton()
    private lazy var imageVideo: UIImageView = {
        var imageVideo = UIImageView()
        
        let image = UIImage(systemName: "play.rectangle")
        imageVideo.image = image
        imageVideo.tintColor = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        
        return imageVideo
    }()
    
    private lazy var labelVideo: UILabel = {
        let label = UILabel()
        
        label.text = "Клип"
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        
        return label
    }()
    
    private lazy var separator: UIView = {
        let separator = UIView()
        
        separator.backgroundColor = #colorLiteral(red: 0.1882351339, green: 0.1882354915, blue: 0.1968305111, alpha: 1)
        
        return separator
    }()
    
    private lazy var mStackView: UIStackView = {
        var stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        
        return stackView
    }()
    
    private lazy var labelCity: UILabel = {
        var label = UILabel()
        
        let image = NSTextAttachment()
        image.image = UIImage(systemName: "house")?.withTintColor(.gray)
        image.bounds = CGRect(x: 0, y: -4, width: 25, height: 20)
        let fullString = NSMutableAttributedString(attachment: image)//
        fullString.append(NSAttributedString(string: "  Город: "))
        fullString.append(NSMutableAttributedString(string: "Архангельск"))
        
        label.attributedText = fullString
        label.font = .systemFont(ofSize: 15 )
        label.textColor = .gray
        
        
        return label
    }()
    
    private lazy var labelSubscribers: UILabel = {
        var label = UILabel()
        
        let image = NSTextAttachment()
        image.image = UIImage(systemName: "dot.radiowaves.up.forward")?.withTintColor(.gray)
        image.bounds = CGRect(x: 0, y: -4, width: 25, height: 20)
        let fullString = NSMutableAttributedString(attachment: image)//
        fullString.append(NSAttributedString(string: "  "))
        fullString.append(NSAttributedString(string: "35"))
        fullString.append(NSMutableAttributedString(string: " Подписчиков"))
        
        label.attributedText = fullString
        label.font = .systemFont(ofSize: 15 )
        label.textColor = .gray
        
        
        return label
    }()
    
    private lazy var buttonJob: UIButton = {
        var button = UIButton(type: .system)
        
        let color = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        
        let image = NSTextAttachment()
        image.image = UIImage(systemName: "case")?.withTintColor(color)
        image.bounds = CGRect(x: 0, y: -4, width: 25, height: 20)
        
        let fullString = NSMutableAttributedString(attachment: image)//
        fullString.append(NSAttributedString(string: "  "))
        fullString.append(NSAttributedString(string: "Указать место работы"))
        button.titleLabel?.font = .systemFont(ofSize: 15 )
        button.setTitleColor(color, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1716532707, green: 0.1766338348, blue: 0.1851372421, alpha: 0)
        button.setAttributedTitle(fullString, for: .normal)
        return button
    }()
    
    private lazy var buttonGift: UIButton = {
        var button = UIButton(type: .system)
        
        let color = #colorLiteral(red: 0.4450312853, green: 0.386110127, blue: 0.7607088685, alpha: 1)
        
        let image = NSTextAttachment()
        image.image = UIImage(systemName: "snowflake")?.withTintColor(color)
        image.bounds = CGRect(x: 0, y: -6, width: 25, height: 25)
        
        let fullString = NSMutableAttributedString(attachment: image)//
        fullString.append(NSAttributedString(string: "  "))
        fullString.append(NSAttributedString(string: "Получить подарок"))
        button.titleLabel?.font = .systemFont(ofSize: 15 )
        button.setTitleColor(color, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1716532707, green: 0.1766338348, blue: 0.1851372421, alpha: 0)
        button.setAttributedTitle(fullString, for: .normal)
        return button
    }()
    
    private lazy var buttonInfo: UIButton = {
        var button = UIButton(type: .system)
        
        let color = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        let img = NSTextAttachment()
        img.image = UIImage(systemName: "info.circle.fill")?.withTintColor(color)
        img.bounds = CGRect(x: 0, y: -6, width: 25, height: 23)
        
        let fullString = NSMutableAttributedString(attachment: img)//
        fullString.append(NSAttributedString(string: "  "))
        fullString.append(NSAttributedString(string: "Подробная информация"))
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        button.setTitleColor(color, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1716532707, green: 0.1766338348, blue: 0.1851372421, alpha: 0)
        button.setAttributedTitle(fullString, for: .normal)
        return button
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
        
            infoStackView.addArrangedSubview(imageAvatar)
            infoStackView.addArrangedSubview(labelStackView)
            
        labelStackView.addArrangedSubview(labelName)
        labelStackView.addArrangedSubview(labelStatus)
        labelStackView.addArrangedSubview(onlineStackView)
            
                    onlineStackView.addArrangedSubview(labelOnline)
        profileStackView.addArrangedSubview(buttonEdit)
        profileStackView.addArrangedSubview(tabStackView)
        
            tabStackView.addArrangedSubview(buttonTabStory)
        buttonTabStory.addSubview(imageStory)
        buttonTabStory.addSubview(labelStory)
            tabStackView.addArrangedSubview(buttonTabNote)
        buttonTabNote.addSubview(imageNote)
        buttonTabNote.addSubview(labelNote)
            tabStackView.addArrangedSubview(buttonTabPhoto)
        buttonTabPhoto.addSubview(labelPhoto)
        buttonTabPhoto.addSubview(imagePhoto)
            tabStackView.addArrangedSubview(buttonTabVideo)
        buttonTabVideo.addSubview(labelVideo)
        buttonTabVideo.addSubview(imageVideo)
        
        profileStackView.addSubview(separator)
        
        profileStackView.addArrangedSubview(separator)
        profileStackView.addArrangedSubview(mStackView)
            mStackView.addArrangedSubview(labelCity)
            mStackView.addArrangedSubview(labelSubscribers)
            mStackView.addArrangedSubview(buttonJob)
            mStackView.addArrangedSubview(buttonGift)
            mStackView.addArrangedSubview(buttonInfo)
        
    }
    
    private func setupLayout() {
        profileStackView.translatesAutoresizingMaskIntoConstraints = false
        profileStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        profileStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        profileStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        imageAvatar.translatesAutoresizingMaskIntoConstraints = false
        imageAvatar.heightAnchor.constraint(equalToConstant: Metric.imgAvaHeight).isActive = true
        imageAvatar.widthAnchor.constraint(equalToConstant: Metric.imgAvaWidth).isActive = true
        
        labelName.translatesAutoresizingMaskIntoConstraints = false
        
        buttonEdit.heightAnchor.constraint(equalToConstant: Metric.btnEditHeight).isActive = true
        
        buttonTabStory.heightAnchor.constraint(equalToConstant: Metric.imgAvaHeight).isActive = true
        buttonTabStory.widthAnchor.constraint(equalToConstant: Metric.imgAvaWidth).isActive = true
        
        buttonTabNote.heightAnchor.constraint(equalToConstant: Metric.imgAvaHeight).isActive = true
        buttonTabNote.widthAnchor.constraint(equalToConstant: Metric.imgAvaWidth).isActive = true
        
        buttonTabPhoto.heightAnchor.constraint(equalToConstant: Metric.imgAvaHeight).isActive = true
        buttonTabPhoto.widthAnchor.constraint(equalToConstant: Metric.imgAvaWidth).isActive = true
        
        buttonTabVideo.heightAnchor.constraint(equalToConstant: Metric.imgAvaHeight).isActive = true
        buttonTabVideo.widthAnchor.constraint(equalToConstant: Metric.imgAvaWidth).isActive = true
        
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        buttonJob.titleLabel?.leadingAnchor.constraint(equalTo: buttonJob.leadingAnchor).isActive = true
        buttonGift.titleLabel?.leadingAnchor.constraint(equalTo: buttonGift.leadingAnchor).isActive = true
        buttonInfo.titleLabel?.leadingAnchor.constraint(equalTo: buttonInfo.leadingAnchor).isActive = true
        
        labelPhoto.translatesAutoresizingMaskIntoConstraints = false
        labelPhoto.centerXAnchor.constraint(equalTo: buttonTabPhoto.centerXAnchor).isActive = true
        labelPhoto.centerYAnchor.constraint(equalTo: buttonTabPhoto.bottomAnchor, constant: -20).isActive = true
        
        imagePhoto.translatesAutoresizingMaskIntoConstraints = false
        imagePhoto.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imagePhoto.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imagePhoto.centerXAnchor.constraint(equalTo: buttonTabPhoto.centerXAnchor).isActive = true
        imagePhoto.centerYAnchor.constraint(equalTo: buttonTabPhoto.topAnchor, constant: 30).isActive = true
        
        labelVideo.translatesAutoresizingMaskIntoConstraints = false
        labelVideo.centerXAnchor.constraint(equalTo: buttonTabVideo.centerXAnchor).isActive = true
        labelVideo.centerYAnchor.constraint(equalTo: buttonTabVideo.bottomAnchor, constant: -20).isActive = true
        
        imageVideo.translatesAutoresizingMaskIntoConstraints = false
        imageVideo.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageVideo.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageVideo.centerXAnchor.constraint(equalTo: buttonTabVideo.centerXAnchor).isActive = true
        imageVideo.centerYAnchor.constraint(equalTo: buttonTabVideo.topAnchor, constant: 30).isActive = true
        
        labelStory.translatesAutoresizingMaskIntoConstraints = false
        labelStory.centerXAnchor.constraint(equalTo: buttonTabStory.centerXAnchor).isActive = true
        labelStory.centerYAnchor.constraint(equalTo: buttonTabStory.bottomAnchor, constant: -20).isActive = true
        
        imageStory.translatesAutoresizingMaskIntoConstraints = false
        imageStory.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageStory.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageStory.centerXAnchor.constraint(equalTo: buttonTabStory.centerXAnchor).isActive = true
        imageStory.centerYAnchor.constraint(equalTo: buttonTabStory.topAnchor, constant: 30).isActive = true
        
        labelNote.translatesAutoresizingMaskIntoConstraints = false
        labelNote.centerXAnchor.constraint(equalTo: buttonTabNote.centerXAnchor).isActive = true
        labelNote.centerYAnchor.constraint(equalTo: buttonTabNote.bottomAnchor, constant: -20).isActive = true
        
        imageNote.translatesAutoresizingMaskIntoConstraints = false
        imageNote.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageNote.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageNote.centerXAnchor.constraint(equalTo: buttonTabNote.centerXAnchor).isActive = true
        imageNote.centerYAnchor.constraint(equalTo: buttonTabNote.topAnchor, constant: 30).isActive = true
        
        
        
        
        
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


