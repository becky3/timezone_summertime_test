import UIKit

class ViewController: UIViewController {

    let adjustSecondsForJapan : TimeInterval = 9 * 60 * 60
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDatePicker()
    }

    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.timeZone = TimeZone(identifier: "Asia/Tokyo")
        datePicker.date = Date(timeIntervalSince1970: -adjustSecondsForJapan)
        datePicker.locale = Locale(identifier: "ja-JP")
    }
    
    private func getDateStrings(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: Int(adjustSecondsForJapan))
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return formatter.string(from: date)

    }
    
    @IBAction func didChangeDatePicker(_ sender: UIDatePicker) {

        label.text = getDateStrings(from: sender.date)

    }
}

