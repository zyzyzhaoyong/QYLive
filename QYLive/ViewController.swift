//
//  ViewController.swift
//  QYLive
//
//  Created by Apple on 2017/2/18.
//  Copyright © 2017年 乔布永. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var live: ZYCell!
    var playerView:UIView!
    var ijkPlayer:IJKMediaPlayback!
    @IBOutlet weak var imgBackView: UIImageView!
    @IBOutlet weak var btnlike: UIButton!
    @IBOutlet weak var btnGift: UIButton!
    @IBOutlet weak var bitBick: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setPlayerView()
        setBG()
        bringBtnToFront()
      
    }
    func setBG () {
        let imgUrl = URL(string:live.portrait)
         imgBackView.kf.setImage(with: imgUrl)
        let blurEffect = UIBlurEffect(style:.light)
        let effectView = UIVisualEffectView(effect:blurEffect)
        effectView.frame = self.view.bounds
        imgBackView.addSubview(effectView)
        
        
    }
    func bringBtnToFront()  {
        view.bringSubview(toFront: btnlike)
        view.bringSubview(toFront: btnGift)
        view.bringSubview(toFront: bitBick)
    }
    func setPlayerView(){
        self.playerView = UIView(frame:view.bounds)
        view.addSubview(self.playerView)
        ijkPlayer = IJKFFMoviePlayerController(contentURLString:live.url, with:nil)
        let pv = ijkPlayer.view!
        pv.frame = playerView.bounds
        pv.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        playerView.insertSubview(pv, at: 1)
        ijkPlayer.scalingMode = .aspectFill

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if !self.ijkPlayer.isPlaying(){
            self.ijkPlayer.prepareToPlay()
        }
    }
    
    @IBAction func btnLike(_ sender: Any) {
        let heart = DMHeartFlyView(frame:CGRect(x: 0, y: 0, width: 40, height: 40))
        heart.center = CGPoint(x:btnlike.frame.origin.x,y:btnlike.frame.origin.y)
        view.addSubview(heart)
        heart.animate(in: view)
        // 爱心按钮 关键帧动画
        let btnAnime = CAKeyframeAnimation(keyPath :"transform.scale")
        btnAnime.values = [1.0,0.7,0.5,0.3,0.5,0.7,1.0,1.2,1.4,1.2,1.0]
        btnAnime.keyTimes = [0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0]
        btnAnime.duration = 0.2
        (sender as AnyObject).layer.add(btnAnime, forKey: "SHOW")
        

    }
    @IBAction func btnGift(_ sender: Any) {
        let duration = 3.0
        let car = UIImageView(image:#imageLiteral(resourceName: "porsche"))
        car.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.addSubview(car)
        let widthCar:CGFloat = 250
        let heightCar:CGFloat = 125
        UIView.animate(withDuration: duration) { 
            car.frame = CGRect(x: self.view.center.x - widthCar/2, y: self.view.center.y - heightCar/2, width: widthCar, height: heightCar)
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + duration){
            UIView.animate(withDuration: duration, animations: { 
                car.alpha = 0
                
            }, completion: { 
                (completed)in
                car.removeFromSuperview()
            })
            
            
        }
        let layerFW = CAEmitterLayer()
        view.layer.addSublayer(layerFW)
        emmitParticles(from: (sender as AnyObject).center, emitter: layerFW, in: view)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration*2) {
            layerFW.removeFromSuperlayer()
        }
        
    }

    @IBAction func btnBack(_ sender: Any) {
        self.ijkPlayer.shutdown()
        navigationController?.popViewController(animated: true)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

