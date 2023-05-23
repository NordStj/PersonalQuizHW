//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 19.02.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var labelImage: UILabel!
    @IBOutlet var labelResult: UILabel!
    
    var answersChosen: [Answer] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        getResult()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func getMostAnimal(with answer: [Answer]) -> Animal? {
        var calculatingAnswers: [Animal: Int] = [:]
        for chosen in answersChosen {
            calculatingAnswers[chosen.animal, default: 0] += 1
        }
        var maxCount = 0
        var mostChoseAnimal: Animal?
        
        for animal in calculatingAnswers {
            if animal.value > maxCount {
                mostChoseAnimal = animal.key
                maxCount = animal.value
            }
        }
        return mostChoseAnimal
    }
    
    private func getResult() {
        let animal = getMostAnimal(with: answersChosen)
        switch animal {
        case .dog:
            labelImage.text = "Вы - 🐶"
            labelResult.text = "Вы - Собака"
        case .cat:
            labelImage.text = "Вы - 🐱"
            labelResult.text = "Вы - Кот"
        case .turtle:
            labelImage.text = "Вы - 🐢"
            labelResult.text = "Вы - Черепаха"
        case .rabbit:
            labelImage.text = "ВЫ - 🐰"
            labelResult.text = "Вы - Кролик"
        case .none:
            return
        }
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
