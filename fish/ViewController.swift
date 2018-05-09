import UIKit
import Lottie


extension CGFloat {
    //Between 0 and 1
    static func random()-> CGFloat {
        return CGFloat(arc4random())/CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: .random(), green: .random(), blue: .random(), alpha: 1)
    }
}

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    let animationView = LOTAnimationView(name: "fish-with-four-bubbles")

    let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))

    override func viewDidLoad() {
        super.viewDidLoad()



        animationView.logHierarchyKeypaths()

        self.view.addSubview(animationView)

        animationView.loopAnimation = true

        self.playAnimation()


        // Do any additional setup after loading the view, typically from a nib.
        self.button.setTitle("click me", for: .normal)
        self.button.addTarget(self, action: #selector(handleTap(_:)), for: .touchUpInside)

        self.view.addSubview(button)

        //To get all keypaths
        animationView.logHierarchyKeypaths()

    }


    private func playAnimation() {
        animationView.play{ (finished) in
            // Do Something or nothing
        }

    }



    @objc func handleTap(_ button:UIButton) {

        let color = UIColor.random()

        let colorValue = LOTColorValueCallback(color: color.cgColor)
        animationView.setValueDelegate(colorValue, for: LOTKeypath(string: "fishuppergill.Shape 1.Fill 1.Color"))
        animationView.setValueDelegate(colorValue, for: LOTKeypath(string: "fishundergill.Shape 1.Fill 1.Color"))
        animationView.setValueDelegate(colorValue, for: LOTKeypath(string: "fishtail.Shape 1.Fill 1.Color"))
        animationView.setValueDelegate(colorValue, for: LOTKeypath(string: "fishlowerbody.Shape 1.Fill 1.Color"))
        animationView.setValueDelegate(colorValue, for: LOTKeypath(string: "fishhead.Shape 1.Fill 1.Color"))
        animationView.setValueDelegate(colorValue, for: LOTKeypath(string: "bubbleone.Group 1.Fill 1.Color"))
        animationView.setValueDelegate(colorValue, for: LOTKeypath(string: "bubbletwo.Group 1.Fill 1.Color"))
        animationView.setValueDelegate(colorValue, for: LOTKeypath(string: "bubblethree.Group 1.Fill 1.Color"))
        animationView.setValueDelegate(colorValue, for: LOTKeypath(string: "bubblefour.Group 1.Fill 1.Color"))
        animationView.setValueDelegate(colorValue, for: LOTKeypath(string: "bubblenew.Group 1.Fill 1.Color"))

    }

}

