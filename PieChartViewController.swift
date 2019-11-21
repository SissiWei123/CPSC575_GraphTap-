
import UIKit
import Charts

class PieChartViewController: UIViewController {

    @IBOutlet weak var pieChart: PieChartView!
    
    
    @IBOutlet weak var nameOneField: UITextField!
    @IBOutlet weak var nameTwoField: UITextField!
    @IBOutlet weak var inputOneField: UITextField!
    @IBOutlet weak var inputTwoField: UITextField!
    
    var firstInput = PieChartDataEntry(value: 0)
    var secondInput = PieChartDataEntry(value: 0)
    
    var numberOfDownloadsDataEntries = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameOneField.delegate = self
        nameTwoField.delegate = self
        inputOneField.delegate = self
        inputTwoField.delegate = self
        
        
        pieChart.chartDescription?.text = ""
        
        firstInput.value = 0
        firstInput.label = "no name 1"
        
        secondInput.value = 0
        secondInput.label = "no name 2"
        
        numberOfDownloadsDataEntries = [firstInput, secondInput]
        
        updateChartData()
        
        
    }
 

    func updateChartData() {
        
        let chartDataSet = PieChartDataSet(entries: numberOfDownloadsDataEntries, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [UIColor(named: "inputOneColor"), UIColor(named:"inputTwoColor")]
        chartDataSet.colors = colors as! [NSUIColor]
        
        pieChart.data = chartData
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func generateTapped(_ sender: Any) {
        firstInput.value = (inputOneField.text! as NSString).doubleValue
        secondInput.value = (inputTwoField.text! as NSString).doubleValue
        firstInput.label = (nameOneField.text!)
        secondInput.label = (nameTwoField.text!)
        updateChartData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        inputOneField.resignFirstResponder()
        inputTwoField.resignFirstResponder()
    }
    
}

extension PieChartViewController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
