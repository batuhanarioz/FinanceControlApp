import SwiftUI

struct BudgetModel: Identifiable, Equatable {

    var id: UUID = UUID()
    var name: String = ""
    var icon: String = ""
    var spend_amount: String = ""
    var total_amount: String = ""
    var left_amount: String = ""
    var perSpend: Double = 0.0
    var color: Color = .secondaryC
    
    init(dict: NSDictionary) {
        self.name = dict.value(forKey: "name") as! String? ?? ""
        self.icon = dict.value(forKey: "icon") as! String? ?? ""
        self.spend_amount = dict.value(forKey: "spend_amount") as! String? ?? ""
        self.total_amount = dict.value(forKey: "total_amount") as! String? ?? ""
        self.left_amount = dict.value(forKey: "left_amount") as! String? ?? ""
        self.color = dict.value(forKey: "color") as! Color
        self.perSpend = ( (Double(self.left_amount) ?? 0) / (Double(self.total_amount) ?? 1.0) )
    }
    
    static func == (lhs: BudgetModel, rhs: BudgetModel) -> Bool {
        return lhs.id == rhs.id
    }
    
}
