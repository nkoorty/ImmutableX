import UIKit

class PlayView: UIView {
    
    lazy var amountLabel: UILabel = {
        let text = UILabel()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        text.font = UIFont.boldSystemFont(ofSize: 20)
        text.text = "Play"
        text.textColor = .white
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .center
        text.isUserInteractionEnabled = true
        text.addGestureRecognizer(tapGestureRecognizer)
        return text
    }()
    
    @objc func handleTap() {
        UIView.animate(withDuration: 0.1) {
          self.amountLabel.textColor = .lightGray
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
          UIView.animate(withDuration: 0.1) {
            self.amountLabel.textColor = .white
          }
        }
      }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 25
        layer.masksToBounds = true
        setUpView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.colors = [UIColor.systemBlue.cgColor, UIColor.systemGreen.cgColor]
        l.startPoint = CGPoint(x: 0, y: 0.5)
        l.endPoint = CGPoint(x: 1, y: 0.5)
        l.cornerRadius = 16
        layer.insertSublayer(l, at: 0)
        return l
    }()
    
    
    func setUpView() {
        addSubview(amountLabel)
        
       // amountLabel.anchor(top: topAnchor, paddingTop: 0, bottom: bottomAnchor, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 0)
        
        amountLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        amountLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
