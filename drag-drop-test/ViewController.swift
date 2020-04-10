import UIKit

class ViewController: UIViewController {

    var myLabel: UILabel?
    var coinCount = 0



    @IBAction func addImage(_ sender: UITapGestureRecognizer) {
        print("tapped")

   // タップする(coinCount==0)とmyLabelが表示される。
    if coinCount == 0 {

        myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        if let myLabel = myLabel {
            myLabel.text = "Drag!"

                  myLabel.textAlignment = NSTextAlignment.center

                  myLabel.backgroundColor = UIColor.red

                  myLabel.layer.masksToBounds = true

                  myLabel.center = sender.location(in: self.view)

                  myLabel.layer.cornerRadius = 40.0

                  UIView.animate(withDuration: 0.10, animations: {

            // アニメーションをつける

                  myLabel.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)

                      }) { (Bool) -> Void in

                  }


                  self.view.addSubview(myLabel)
        }

  // ２回目のタップの時(coinCount==2)ラベルが消える。
    } else if coinCount == 1 {
        myLabel?.removeFromSuperview()
    }

    coinCount = coinCount + 1
    coinCount = coinCount % 2

    }

  // ドラッグした時のコード
    @IBAction override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesMoved")
        
        guard let myLabel = myLabel else { return }

        let aTouch = touches.first!

        let location = aTouch.location(in: myLabel)

        let prevLocation = aTouch.previousLocation(in: myLabel)

        var myFrame: CGRect = myLabel.frame

            // ドラッグで移動したx, y距離をとる.

            let deltaX: CGFloat = location.x - prevLocation.x

            let deltaY: CGFloat = location.y - prevLocation.y


            // 移動した分の距離をmyFrameの座標にプラスする.

            myFrame.origin.x += deltaX

            myFrame.origin.y += deltaY


            // frameにmyFrameを追加.

            myLabel.frame = myFrame

        }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
