//
//  ViewController.swift
//  SlideshowApp2
//
//  Created by hiroko on 2016/12/07.
//  Copyright © 2016年 hiroko. All rights reserved.
//


//タップイベント作って画面遷移　窓クローズで　画像そろえ

//http://zutto-megane.com/objective-c/post-300/

import UIKit

class ViewController: UIViewController {

    //画像配列
    let photos = ["flower1.jpg","flower2.jpg","flower3.jpg","flower4.jpg","flower5.jpg"]
    
    @IBOutlet weak var ImageUIImageView: UIImageView!
    
    var No: Int = 0
    
    var timer: Timer? = nil
    
    @IBAction func NextUIButton(_ sender: UIButton) {
        
        //配列と同じ数のときはリセット、それ以外は＋１
        if No == photos.count - 1 {
            No = 0
        }else{
            No += 1
        }
        let myPhoto2:String = photos[No]
        ImageUIImageView.image = UIImage(named: myPhoto2)
        self.view.addSubview(ImageUIImageView)


        
    }
    
    @IBAction func BackUIButton(_ sender: UIButton) {
        //配列と同じ数のときはリセット、それ以外は-１
        if No == photos.count - 1 {
            No = 0
        }else{
            No += 1
        }
        let myPhoto2:String = photos[No]
        ImageUIImageView.image = UIImage(named: myPhoto2)
        self.view.addSubview(ImageUIImageView)

    }
    
    @IBAction func ShowUIButton(_ sender: UIButton) {
        if timer == nil {
            //timerを生成する.
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.NextUIButton(_:)), userInfo: nil, repeats: true)
            //ボタンのタイトル変更.
            sender.setTitle("Stop", for: UIControlState.normal)
            timer?.fire()
        }else{
            timer?.invalidate()//停止
            timer = nil
            sender.setTitle("Start", for: UIControlState.normal)
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myPhoto:String = photos[No]//画像ファイル名を変数に格納
        ImageUIImageView.image = UIImage(named: myPhoto)//UIImageに変換？？？
        self.view.addSubview(ImageUIImageView)//画像を表示

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

