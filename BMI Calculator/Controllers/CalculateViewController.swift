

import UIKit

class CalculateViewController: UIViewController {    
   
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!    
    @IBOutlet weak var weightSlider: UISlider!
    var bmiBrain = BmiBrain()
            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
    }
    
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let height  = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight  = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        bmiBrain.calculateBMI(height, weight)
        performSegue(withIdentifier: "goToResult", sender: self)
                
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let secondVC = segue.destination as! ResultsViewController
          
            secondVC.bmiValue = bmiBrain.getBMIValue()
            secondVC.advice = bmiBrain.getAdvice()
            secondVC.color = bmiBrain.getColor()
        }
    }
    
}

