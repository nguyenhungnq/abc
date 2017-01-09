//
//  ViewController.swift
//  PartyRock
//
//  Created by NguyenHung on 1/7/17.
//  Copyright © 2017 NguyenHung. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "http://www.planwallpaper.com/static/images/Anime-7.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/C7D8XXK7nmk\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Nhạc Hoa hay nhất : Đừng nghe kẻo nghiện")
        
        let p2 = PartyRock(imageURL: "http://i2.mirror.co.uk/incoming/article6393587.ece/ALTERNATES/s615/MAIN-Daniel-Craig-in-a-new-photoshoot-to-announce-the-release-of-tickets-Bond-film-Spectre.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/8jzDnsjYv9A\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Sam Smith - Writing's On The Wall")
        
        let p3 = PartyRock(imageURL: "http://celebmix.com/wp-content/uploads/2016/03/sam-smith-apologizes-for-his-oscar-speech-01.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/nCkpzqqog4k\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Sam Smith - I'm Not The Only One")
        
        let p4 = PartyRock(imageURL: "http://125.235.37.57/medias12//2015/08/04/8afbe2fb-3062-4962-b6c7-a7cb15868272.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/C7D8XXK7nmk\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Nhạc Hoa hay nhất : Đừng nghe kẻo nghiện")
        
        let p5 = PartyRock(imageURL: "http://motgame.vn/wp-content/uploads/2016/06/last-guardian.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/QLzUWJ0zk5M\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "I WAITED 6 YEARS TO PLAY THIS.. The Last Guardian - Demo")
        //1 tao row cho cac item
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as?  PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            //2 lenh nay se kiem tra xem co bao nhieu item
            //4 Dang ve o cho nay
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
            //3 Chay lan luot tu 0 > 4 cac phan tu trong mang?
            
        } else {
            return UITableViewCell()
        }
        //Chay het cai nay thi man hinh hien ra
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Click vao video bat ky thi chay den day.
        
        let partyRock = partyRocks[indexPath.row]
        //5 dong nay de kiem tra vua click vao item nao
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
        //truyen data cho VideoVC
        //6 khi click vao thi nhay ra day
        //7 Khi click vao se tim den segue VideoVC
        //8 Truyen partyRock cho VideoVC
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VideoVC {
            
            if let party = sender as? PartyRock {
                destination.partyRock = party
                //Chay het doan nay thi video hien ra
            }
            
        }
        
    }

}

