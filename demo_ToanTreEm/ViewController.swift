//
//  ViewController.swift
//  demo_ToanTreEm
//
//  Created by hungtran on 6/1/17.
//  Copyright © 2017 hungtran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lbl_dau: UILabel!
    
    
    @IBOutlet weak var btn_kq1: UIButton!
    
    @IBOutlet weak var btn_kq2: UIButton!
    
    @IBOutlet weak var btn_kq3: UIButton!
    
    
    
    @IBOutlet weak var lbl_sai: UILabel!
    
    @IBOutlet weak var lbl_dung: UILabel!
    
    
    @IBOutlet weak var lbl_so1: UILabel!
    
    @IBOutlet weak var lbl_so2: UILabel!
    
    @IBOutlet weak var btn_action: UIButton!
    
    @IBOutlet weak var lbl_time: UILabel!
    
    var random1 : Int!
    var random2 : Int!
    var counter = 0
    var tg = Timer()
    var demso = 0
    var dung = 0
    var sai = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tg = Timer.scheduledTimer(timeInterval:1.0, target:self, selector: #selector(dem), userInfo:nil ,repeats:true)
        // Do any additional setup after loading the view, typically from a nib.
        setrandom()
        start()
    }
    @IBAction func btn_action(_ sender: Any) {
        ktkq(sender as! UIButton)
        setrandom()
        start()
    }

    func start()  {
        demso = 10
    }
    func dem()    {
        demso -= 1
        lbl_time.text = "\(demso)"
        if (demso == 0) {
            sai = sai + 1
            lbl_sai.text = String(sai)
            start()
            setrandom()
        }
    }
    
    
    
    func setrandom()  {
        random1 = Int(arc4random_uniform(9) + 1)
        random2 = Int(arc4random_uniform(8) + 1)
        print("\(random1!) \(random2!)")
        lbl_so1.text = String(random1)
        lbl_so2.text = String(random2)
        randomdau()
        randomvitri()
    }

    func randomdau() {
        let dau = Int(arc4random_uniform(4))
        print(dau)
        if (dau == 0) {
            lbl_dau.text = "+"
        }
        else if (dau == 1) {
            lbl_dau.text = "-"
            while (random1 < random2) {
                random1 = Int(arc4random_uniform(9) + 1)
                random2 = Int(arc4random_uniform(8) + 1)
                lbl_so1.text = String(random1)
                lbl_so2.text = String(random2)
            }
        }
        else if (dau == 2) {
            lbl_dau.text = "x"
        }
        else {
            self.lbl_dau.text = ":"
            var du = random1%random2
            while (du != 0) {
                random1 = Int(arc4random_uniform(9) + 1)
                random2 = Int(arc4random_uniform(8) + 1)
                du = random1%random2
                lbl_so1.text = String(random1)
                lbl_so2.text = String(random2)
            }
            
        }
    }
    func ketqua() -> Int {
        var ketqua = 0
        if (lbl_dau.text == "+") {
            ketqua = tong(p1: Int(lbl_so1.text!)!, p2: Int(lbl_so2.text!)!)
        }
        if (lbl_dau.text == "-") {
            ketqua = hieu(p1: Int(lbl_so1.text!)!, p2: Int(lbl_so2.text!)!)
        }
        if (lbl_dau.text == "x") {
            ketqua = nhan(p1: Int(lbl_so1.text!)!, p2: Int(lbl_so2.text!)!)
        }
        if (lbl_dau.text == ":") {
            ketqua = chia(p1: Int(lbl_so1.text!)!, p2: Int(lbl_so2.text!)!)
        }
        return ketqua
    
    }
    
    func randomvitri()  {
        let vitri = Int(arc4random_uniform(3))
        print(vitri)
        if (vitri == 0) {
            btn_kq1.setTitle(String(random1 + 1), for: .normal)
            btn_kq2.setTitle(String(random2 - 1), for: .normal)
            btn_kq3.setTitle(String(ketqua()), for: .normal)
        }
        if (vitri == 1) {
            btn_kq1.setTitle(String(random1 + 1), for: .normal)
            btn_kq3.setTitle(String(random2 - 1), for: .normal)
            btn_kq2.setTitle(String(ketqua()), for: .normal)
        }
        if (vitri == 2) {
            btn_kq3.setTitle(String(random1 + 1), for: .normal)
            btn_kq2.setTitle(String(random2 - 1), for: .normal)
            btn_kq1.setTitle(String(ketqua()), for: .normal)
        }
        
    }
    
    
    func tong(p1: Int, p2: Int) -> Int {
        return p1+p2
    }
    func hieu(p1: Int, p2: Int) -> Int {
        return p1-p2
    }
    func nhan(p1: Int, p2: Int) -> Int {
        return p1*p2
    }
    func chia(p1:Int ,p2: Int) -> Int {
        return p1/p2
    }
    func ktkq(_ sender: UIButton)  {
        lbl_dung.text = String(dung)
        lbl_sai.text = String(sai)
        let tong = (Int(lbl_so1.text!)! + Int(lbl_so2.text!)!)
        let hieu = (Int(lbl_so1.text!)! - Int(lbl_so2.text!)!)
        let nhan = (Int(lbl_so1.text!)! * Int(lbl_so2.text!)!)
        let chia = (Int(lbl_so1.text!)! / Int(lbl_so2.text!)!)
        if tong == (Int(sender.currentTitle!)) || hieu == (Int(sender.currentTitle!)) || nhan == (Int(sender.currentTitle!)) || chia == (Int(sender.currentTitle!)) {
            dung = dung + 1
            lbl_dung.text = String(dung)
        }else{
            sai = sai + 1
            lbl_sai.text = String(sai)
        }
        
        
        
        
    }
    
    
}

