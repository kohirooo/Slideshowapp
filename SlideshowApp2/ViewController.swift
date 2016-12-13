//
//  ViewController.swift
//  SlideshowApp2
//
//  Created by hiroko on 2016/12/07.
//  Copyright © 2016年 hiroko. All rights reserved.
//


//タップイベント作って画面遷移　窓クローズで　画像そろえ


import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var ImageUIImageView: UIImageView!

    @IBOutlet weak var SlideshowUIButton: UIButton!
    //画像配列
    let photos = [
        "flower1.jpg",
        "flower2.jpg",
        "flower3.jpg",
        "flower4.jpg",
        "flower5.jpg"]
    
    
    var No: Int = 0
    var timer: Timer? = nil
    
    @IBAction func NextUIButton(_ sender: UIButton) {
        
        //次へのボタン
        //配列と同じ数のときはリセット、それ以外は＋１
        if No == photos.count - 1 {
            No = 0
        }else{
            No += 1
        }
        let myPhoto2:String = photos[No]
        ImageUIImageView.image = UIImage(named: myPhoto2)
    }
    
    @IBAction func BackUIButton(_ sender: UIButton) {
        //前へのボタン
        //配列と同じ数のときはリセット、それ以外は-１
        if No == photos.count - 1 {
            No = 0
        }else{
            No += 1
        }
        let myPhoto2:String = photos[No]
        ImageUIImageView.image = UIImage(named: myPhoto2)
    }
    
    @IBAction func ShowUIButton(_ sender: UIButton) {
        //再生・停止ボタン
        if timer == nil {
            //timerを生成する.
            timer = Timer.scheduledTimer(
                timeInterval: 2.0,
                target: self,
                selector: #selector(self.NextUIButton(_:)),
                userInfo: nil, repeats: true
            )
            //ボタンのタイトル変更.
            sender.setTitle("Stop", for: UIControlState.normal)
            timer?.fire()
            backButton.isEnabled = false
            nextButton.isEnabled = false

        }else{
            timer?.invalidate()//停止
            timer = nil
            //スタートボタンが押されたら次へ前へのボタンをオフに
            sender.setTitle("Start", for: UIControlState.normal)
            backButton.isEnabled = true
            nextButton.isEnabled = true
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let myPhoto:String = photos[No]//画像ファイル名を変数に格納
        ImageUIImageView.image = UIImage(named: myPhoto)//UIImageに変換？
        self.view.addSubview(ImageUIImageView)//画像を表示

    }
    /**
     * タップイベント
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if ((event?.touches(for: ImageUIImageView)) != nil) {
            
            
            timer?.invalidate()//停止
            //スタートボタンが押されたら次へ前へのボタンをオフに
            backButton.isEnabled = true
            nextButton.isEnabled = true
            SlideshowUIButton.setTitle("Start", for: UIControlState.normal)
            
            self.performSegue(withIdentifier: "segueSecound", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let s = segue.destination as! SecondViewController
        let imageName = photos[No]
        s.image = UIImage(named: imageName)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

