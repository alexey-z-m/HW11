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
        let image = UIImage(named: Strings.imageAvatarName)
        imageAvatar.image = image
        imageAvatar.clipsToBounds = true
        imageAvatar.layer.cornerRadius = Metric.imagegAvatarHeight / 2
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
        labelName.text = Strings.profileName
        labelName.font = Metric.profileNameFont
        labelName.textColor = .white
        return labelName
    }()
    
    private lazy var labelStatus: UIButton = {
        var labelStatus = UIButton(type: .system)
        labelStatus.setTitle(Strings.labelStatus, for: .normal)
        labelStatus.titleLabel?.font = .systemFont(ofSize: 14 )
        let color = Colors.labelStatus
        labelStatus.setTitleColor(color, for: .normal)
        labelStatus.contentHorizontalAlignment = .leading
        labelStatus.backgroundColor = Colors.transparent
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
        imagePhone.image = UIImage(systemName: IconsName.labelOnline)?.withTintColor(.gray)
        imagePhone.bounds = CGRect(x: 0, y: -2, width: 11, height: 14)
        let fullString = NSMutableAttributedString(string: Strings.labelOnline)
        fullString.append(NSAttributedString(attachment: imagePhone))
        labelOnline.attributedText = fullString
        labelOnline.font = .systemFont(ofSize: 14 )
        labelOnline.textColor = .gray
        return labelOnline
    }()
    
    private lazy var buttonEdit: UIButton = {
        var buttonEdit = UIButton(type: .system)
        buttonEdit.setTitle(Strings.buttonEdit, for: .normal)
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
        let imageCamera = UIImage(systemName: IconsName.labelStory)
        imageStory.image = imageCamera
        imageStory.tintColor = Colors.imageStory
        return imageStory
    }()
    
    private lazy var labelStory: UILabel = {
        let label = UILabel()
        label.text = Strings.labelStory
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = Colors.labelStory
        return label
    }()
    
    private lazy var buttonTabNote: UIButton = UIButton()
    private lazy var imageNote: UIImageView = {
        var imageNote = UIImageView()
        let image = UIImage(systemName: IconsName.labelNote)
        imageNote.image = image
        imageNote.tintColor = Colors.imageNote
        return imageNote
    }()
    
    private lazy var labelNote: UILabel = {
        let label = UILabel()
        label.text = Strings.labelNote
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = Colors.labelNote
        return label
    }()
    
    private lazy var buttonTabPhoto: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private lazy var imagePhoto: UIImageView = {
        var imagePhoto = UIImageView()
        let image = UIImage(systemName: IconsName.labelPhoto)
        imagePhoto.image = image
        imagePhoto.tintColor = Colors.imagePhoto
        return imagePhoto
    }()
    
    private lazy var labelPhoto: UILabel = {
        let label = UILabel()
        label.text = Strings.labelPhoto
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = Colors.labelPhoto
        return label
    }()
    
    private lazy var buttonTabVideo: UIButton = UIButton()
    private lazy var imageVideo: UIImageView = {
        var imageVideo = UIImageView()
        let image = UIImage(systemName: IconsName.labelVideo)
        imageVideo.image = image
        imageVideo.tintColor = Colors.imageVideo
        return imageVideo
    }()
    
    private lazy var labelVideo: UILabel = {
        let label = UILabel()
        label.text = Strings.labelVideo
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = Colors.labelVideo
        return label
    }()
    
    private lazy var separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = Colors.separator
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
        image.image = UIImage(systemName: IconsName.labelCity)?.withTintColor(.gray)
        image.bounds = CGRect(x: 0, y: -4, width: 25, height: 20)
        let fullString = NSMutableAttributedString(attachment: image)
        fullString.append(NSAttributedString(string: Strings.labelCity))
        fullString.append(NSMutableAttributedString(string: Strings.City))
        label.attributedText = fullString
        label.font = .systemFont(ofSize: 15 )
        label.textColor = .gray
        return label
    }()
    
    private lazy var labelSubscribers: UILabel = {
        var label = UILabel()
        let image = NSTextAttachment()
        image.image = UIImage(systemName: IconsName.labelSubscribers)?.withTintColor(.gray)
        image.bounds = CGRect(x: 0, y: -4, width: 25, height: 20)
        let fullString = NSMutableAttributedString(attachment: image)
        fullString.append(NSAttributedString(string: "  "))
        fullString.append(NSAttributedString(string: "35"))
        fullString.append(NSMutableAttributedString(string: Strings.labelSubscribers))
        label.attributedText = fullString
        label.font = .systemFont(ofSize: 15 )
        label.textColor = .gray
        return label
    }()
    
    private lazy var buttonJob: UIButton = {
        var button = UIButton(type: .system)
        let color = Colors.buttonJob
        let image = NSTextAttachment()
        image.image = UIImage(systemName: IconsName.buttonJob)?.withTintColor(color)
        image.bounds = CGRect(x: 0, y: -4, width: 25, height: 20)
        let fullString = NSMutableAttributedString(attachment: image)
        fullString.append(NSAttributedString(string: "  "))
        fullString.append(NSAttributedString(string: Strings.buttonJob))
        button.titleLabel?.font = .systemFont(ofSize: 15 )
        button.setTitleColor(color, for: .normal)
        button.backgroundColor = Colors.transparent
        button.setAttributedTitle(fullString, for: .normal)
        return button
    }()
    
    private lazy var buttonGift: UIButton = {
        var button = UIButton(type: .system)
        let color = Colors.buttonGift
        let imageSnowflake = NSTextAttachment()
        imageSnowflake.image = UIImage(systemName: IconsName.buttonGift)?.withTintColor(color)
        imageSnowflake.bounds = CGRect(x: 0, y: -6, width: 25, height: 25)
        let fullString = NSMutableAttributedString(attachment: imageSnowflake)
        fullString.append(NSAttributedString(string: "  "))
        fullString.append(NSAttributedString(string: Strings.buttonGift))
        button.titleLabel?.font = .systemFont(ofSize: 15 )
        button.setTitleColor(color, for: .normal)
        button.backgroundColor = Colors.transparent
        button.setAttributedTitle(fullString, for: .normal)
        return button
    }()
    
    private lazy var buttonInfo: UIButton = {
        var button = UIButton(type: .system)
        let color = Colors.buttonInfo
        let img = NSTextAttachment()
        img.image = UIImage(systemName: IconsName.buttonInfo)?.withTintColor(color)
        img.bounds = CGRect(x: 0, y: -6, width: 25, height: 23)
        let fullString = NSMutableAttributedString(attachment: img)
        fullString.append(NSAttributedString(string: "  "))
        fullString.append(NSAttributedString(string: Strings.buttonInfo))
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        button.setTitleColor(color, for: .normal)
        button.backgroundColor = Colors.transparent
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
        imageAvatar.heightAnchor.constraint(equalToConstant: Metric.imagegAvatarHeight).isActive = true
        imageAvatar.widthAnchor.constraint(equalToConstant: Metric.imagegAvatarWidth).isActive = true
        labelName.translatesAutoresizingMaskIntoConstraints = false
        buttonEdit.heightAnchor.constraint(equalToConstant: Metric.btnEditHeight).isActive = true
        buttonTabStory.heightAnchor.constraint(equalToConstant: Metric.imagegAvatarHeight).isActive = true
        buttonTabStory.widthAnchor.constraint(equalToConstant: Metric.imagegAvatarWidth).isActive = true
        buttonTabNote.heightAnchor.constraint(equalToConstant: Metric.imagegAvatarHeight).isActive = true
        buttonTabNote.widthAnchor.constraint(equalToConstant: Metric.imagegAvatarWidth).isActive = true
        buttonTabPhoto.heightAnchor.constraint(equalToConstant: Metric.imagegAvatarHeight).isActive = true
        buttonTabPhoto.widthAnchor.constraint(equalToConstant: Metric.imagegAvatarWidth).isActive = true
        buttonTabVideo.heightAnchor.constraint(equalToConstant: Metric.imagegAvatarHeight).isActive = true
        buttonTabVideo.widthAnchor.constraint(equalToConstant: Metric.imagegAvatarWidth).isActive = true
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
        view.backgroundColor = Colors.colorBackground
    }
}

extension ViewProfile {
    enum Metric {
        static let profileNameFont = UIFont(name: "Helvetica-Bold", size: 18)
        static let imagegAvatarHeight: CGFloat = 80
        static let imagegAvatarWidth: CGFloat = 80
        static let btnEditHeight: CGFloat = 35
    }
    
    enum Colors {
        static let lightBlue = #colorLiteral(red: 0.4912340641, green: 0.6395314336, blue: 0.9491468072, alpha: 1)
        static let colorBackground = #colorLiteral(red: 0.09803896397, green: 0.0980393663, blue: 0.1066243127, alpha: 1)
        static let separator = #colorLiteral(red: 0.1882351339, green: 0.1882354915, blue: 0.1968305111, alpha: 1)
        static let transparent = #colorLiteral(red: 0.1716532707, green: 0.1766338348, blue: 0.1851372421, alpha: 0)
        static let buttonInfo = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        static let buttonGift = #colorLiteral(red: 0.4450312853, green: 0.386110127, blue: 0.7607088685, alpha: 1)
        static let buttonJob = lightBlue
        static let imageVideo = lightBlue
        static let labelVideo = lightBlue
        static let imagePhoto = lightBlue
        static let labelPhoto = lightBlue
        static let imageNote = lightBlue
        static let labelNote = lightBlue
        static let imageStory = lightBlue
        static let labelStory = lightBlue
        static let buttonEdit = #colorLiteral(red: 0.1716532707, green: 0.1766338348, blue: 0.1851372421, alpha: 1)
        static let labelStatus = lightBlue
    }
    
    enum Strings {
        static let imageAvatarName = "ava"
        static let profileName = "Alexey Zablotskiy"
        static let labelStatus = "Установить статус"
        static let labelOnline = "online"
        static let buttonEdit = "Редактировать"
        static let labelStory = "История"
        static let labelNote = "Запись"
        static let labelPhoto = "Фото"
        static let labelVideo = "Клип"
        static let labelCity = "  Город: "
        static let City = "Архангельск"
        static let labelSubscribers = " Подписчиков"
        static let buttonJob = "Указать место работы"
        static let buttonGift = "Получить подарок"
        static let buttonInfo = "Подробная информация"
    }
    
    enum IconsName {
        static let labelOnline = "iphone.homebutton"
        static let labelStory = "camera"
        static let labelNote = "square.and.pencil"
        static let labelVideo = "play.rectangle"
        static let labelPhoto = "photo"
        static let labelSubscribers = "dot.radiowaves.up.forward"
        static let labelCity = "house"
        static let buttonJob = "case"
        static let buttonGift = "snowflake"
        static let buttonInfo = "info.circle.fill"
    }
}


