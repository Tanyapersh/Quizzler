

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var falseButton: UIButton!
    
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        upDate()
        progressBar.progress = 0
    }
    
    
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        
        
        let userAnswer = sender.currentTitle!
        let correctAnswer = quizBrain.rightAnswer(userAnswer)
        
        if correctAnswer{
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(upDate), userInfo: nil, repeats: false)
    }
    
    @objc func upDate() {
        questionLabel.text = quizBrain.getQuestion()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score : \(quizBrain.getScore())"
    }
    
}

