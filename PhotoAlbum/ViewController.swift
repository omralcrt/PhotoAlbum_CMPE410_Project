//
//  ViewController.swift
//  PhotoAlbum
//
//  Created by Ömral Cörüt on 19.04.2017.
//  Copyright © 2017 Ömral Cörüt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainImaj: UIImageView!
    @IBOutlet weak var albumImaj: UIImageView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var lastButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    //our main photos
    var mainImages:[UIImage] = [
        UIImage(named: "photo1.jpg")!,
        UIImage(named: "photo2.jpg")!,
        UIImage(named: "photo3.jpg")!,
        UIImage(named: "photo4.jpg")!,
        UIImage(named: "photo5.jpg")!,
        UIImage(named: "photo6.jpg")!,
        UIImage(named: "photo7.jpg")!,
        UIImage(named: "photo8.jpg")!,
        UIImage(named: "photo9.jpg")!,
        UIImage(named: "photo10.jpg")!
    ]
    var mainCounter: Int = 0
    
    //our album photos
    var albumImages:[UIImage] = [
        UIImage(named: "photo1.jpg")!
    ]
    var albumCounter: Int = 0
    
    //started function
    override func viewDidLoad() {
        super.viewDidLoad()
        mainImaj.image = (mainImages[0])
        albumImaj.image = (albumImages[0])
        checkButtons(albumCounter)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        mainImaj.isUserInteractionEnabled = true
        mainImaj.addGestureRecognizer(tapGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //check buttons and disable some
    func checkButtons(_ i: Int) {
        if albumImages.count == 1 {
            firstButton.isEnabled = false
            previousButton.isEnabled = false
            nextButton.isEnabled = false
            lastButton.isEnabled = false
            deleteButton.isEnabled = false
        } else if albumCounter == 0 {
            firstButton.isEnabled = false
            previousButton.isEnabled = false
            nextButton.isEnabled = true
            lastButton.isEnabled = true
            deleteButton.isEnabled = true
        }
        else if albumCounter == albumImages.count-1 {
            firstButton.isEnabled = true
            previousButton.isEnabled = true
            nextButton.isEnabled = false
            lastButton.isEnabled = false
            deleteButton.isEnabled = true
        } else {
            firstButton.isEnabled = true
            previousButton.isEnabled = true
            nextButton.isEnabled = true
            lastButton.isEnabled = true
            deleteButton.isEnabled = true
        }
    }

    //when image tapped, change it
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if mainCounter == mainImages.count-1 {
            mainCounter = 0
            mainImaj.image = (mainImages[mainCounter])
        } else {
            mainCounter += 1
            mainImaj.image = (mainImages[mainCounter])
        }
    }

    //copy main photo to our album
    @IBAction func copyPhotoClick(_ sender: UIButton) {
        albumImages.append(mainImages[mainCounter])
        checkButtons(albumCounter)
    }
    
    //show first photo
    @IBAction func firstClick(_ sender: UIButton) {
        albumCounter = 0
        albumImaj.image = (albumImages[albumCounter])
        checkButtons(albumCounter)
    }
    
    //show previous photo
    @IBAction func previousClick(_ sender: UIButton) {
        albumCounter -= 1
        albumImaj.image = (albumImages[albumCounter])
        checkButtons(albumCounter)
    }
    
    //show next photo
    @IBAction func nextClick(_ sender: UIButton) {
        albumCounter += 1
        albumImaj.image = (albumImages[albumCounter])
        checkButtons(albumCounter)
    }
    
    //show last photo
    @IBAction func lastClick(_ sender: UIButton) {
        albumCounter = albumImages.count-1
        albumImaj.image = (albumImages[albumCounter])
        checkButtons(albumCounter)
    }
    
    //delete photo in our album
    @IBAction func deleteClick(_ sender: UIButton) {
        albumImages.remove(at: albumCounter)
        loadNewImage()
    }
    
    //after deleted, show next or previous photo
    func loadNewImage() {
        if albumCounter == albumImages.count {
            albumCounter -= 1
        }
        albumImaj.image = (albumImages[albumCounter])
        checkButtons(albumCounter)
    }
    
}

