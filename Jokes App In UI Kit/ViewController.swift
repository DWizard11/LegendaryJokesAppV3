//
//  ViewController.swift
//  Jokes App In UI Kit
//
//  Created by DWizard11 on 21/6/22.
//

import UIKit

class ViewController: UIViewController {
    
    var currentJoke = 0
    var isPunchlineShown = false
    
    let jokes = [
        Joke(setup: "Why did the chicken cross the road?",
             punchline: "To get to the other side!!"),
        Joke(setup: "Why couldn't the bicycle stand up?",
             punchline: "Because it was two tyre-d!!"),
        Joke(setup: "Dad, can you put my shoes on?",
             punchline: "No, I don't think it will fit me !!"),
        Joke(setup: "What is the warmest section in a square room?",
             punchline: "The corner because it is always 90 degrees!!"),
        Joke(setup: "Where is the best place to be during a zombie invasion?",
             punchline: "The living room!!"),
        Joke(setup: "What is the tallest building in the world?",
             punchline: "A library because it has many stories!!"),
        Joke(setup: "What’s the last thing to go through a fly’s head as it hits the windshield of a car going 90 km/h?" ,
             punchline: "Its butt!!"),
        Joke(setup: "Why don’t cannibals eat clowns?",
             punchline: "Because they taste funny!!"),
        Joke(setup: "When does a joke become a dad joke? ",
             punchline: "When it leaves you and never comes back!!"),
        Joke(setup: "Why can’t Michael Jackson go within 500 meters of a school?",
             punchline: "Because he's already dead."),
        Joke(setup: "What is the difference between Iron Man and Iron Woman?" ,
             punchline: "One is a superhero and the other is a simple command!!"),
    ]
    
    let positiveAlert = UIAlertController(title: "THANK YOU!", message: "YES IT IS VERY FUNNY!", preferredStyle: .alert)
    
    let negativeAlert = UIAlertController(title: "SCREW YOU!!", message: "HOW DARE YOU!", preferredStyle: .alert)
    
    @IBOutlet weak var setupLabel: UILabel!
    @IBOutlet weak var whatButton: UIButton!
    @IBOutlet weak var punchlineLabel: UILabel!
    @IBOutlet weak var continueLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    func setUpCurrentJoke(){
        setupLabel.text = jokes[currentJoke].setup
        punchlineLabel.text = jokes[currentJoke].punchline
        punchlineLabel.isHidden = true
        continueLabel.isHidden = true
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCurrentJoke()
        
    }
    @IBAction func whatButtonPressed(_ sender: Any) {
        punchlineLabel.isHidden = false
        continueLabel.isHidden = false
        isPunchlineShown = true
    }
    
    @IBAction func screenTapped(_ sender: Any) {
        if isPunchlineShown{
            currentJoke += 1
            if currentJoke == jokes.count{
                currentJoke = 0
            }
            setUpCurrentJoke()
            isPunchlineShown = false
        }
        
    }
    @IBAction func yesButtonPressed(_ sender: Any) {
        if isPunchlineShown{
            performSegue(withIdentifier: "correct",
            sender: nil)
            currentJoke += 1
        }
        isPunchlineShown = false
    }
    @IBAction func noButtonPressed(_ sender: Any) {
        negativeAlert.addAction(UIAlertAction(title: NSLocalizedString("PRESS ME IF HAVE 0 IQ", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"negative\" alert occured.")
        }))
        self.present(negativeAlert, animated: true, completion: nil)
    }
    

}



//alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
//NSLog("The \"OK\" alert occured.")
//}))
//self.present(alert, animated: true, completion: nil)
