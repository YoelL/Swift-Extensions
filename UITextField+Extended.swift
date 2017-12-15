
import Foundation

extension UITextField {
    
    // This adds an image to the left of the text field, like an email icon in the email text field.
    
    func addLeftImage(image: UIImage) {
        
        let leftPadding = CGPoint(x: 15, y: frame.size.height/2)
        
        leftViewMode = .always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let textFieldImage = image
        
        imageView.image = textFieldImage
        imageView.alpha = 0.3
        imageView.center = leftPadding
        addSubview(imageView)
    }
    
    
    // this will indent the text in your text field. It creates a view that creates the space. So set the width to how big you'd like the indent to be.
    
    func indentText(width: CGFloat) {
        let indentView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 20))
        leftView = indentView
        leftViewMode = .always
    }
}
