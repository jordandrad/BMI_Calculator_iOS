

import UIKit

struct BmiBrain{

    var bmi: BMI?
    
    func getBMIValue() -> String{
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
            return bmiTo1DecimalPlace
    }
   mutating func calculateBMI(_ height:Float, _ weight:Float){
       let bmiValue = weight/(height * height)
       if bmiValue < 18.5{
           bmi = BMI(value: bmiValue, advice: "Eat smore pies!", color: UIColor.blue )
       } else if bmiValue < 24.9{
           bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.green )
       } else{
           bmi = BMI(value: bmiValue, advice: "Est less pies!", color: UIColor.red)
       }
    }
    func getAdvice() -> String{
        return bmi?.advice ?? "No advice"
    }
    func getColor() -> UIColor{
        return bmi?.color ?? UIColor.white
    }
}



