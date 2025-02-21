//
//  MyRecipeViewModel.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 21/02/25.
//

import Foundation

class MyRecipeViewModel {
    func fetchData() -> [Medicine] {
        return DBHelper.shared.fetchRecipe()
    }
    
    func deleteRecipe(id: Int) {
        DBHelper.shared.deleteRecipe(id: id)
    }
    
//    private let mockMedicamentos = [
//        ("Paracetamol 500mg", "08:00", "8 em 8 horas"),
//        ("Ibuprofeno 400mg", "12:00", "12 em 12 horas"),
//        ("Amoxicilina 500mg", "07:00", "8 em 8 horas"),
//        ("Omeprazol 20mg", "06:30", "Diariamente"),
//        ("Loratadina 10mg", "09:00", "Diariamente"),
//        ("Metformina 850mg", "13:00", "12 em 12 horas"),
//        ("Losartana 50mg", "15:00", "2 em 2 horas"),
//        ("Cetirizina 10mg", "10:00", "Diariamente"),
//        ("Dipirona 500mg", "14:00", "6 em 6 horas"),
//        ("Prednisona 20mg", "08:00", "24 em 24 horas"),
//        ("Ranitidina 150mg", "19:00", "Diariamente"),
//        ("Azitromicina 500mg", "11:00", "24 em 24 horas"),
//        ("Captopril 25mg", "07:00", "Diariamente"),
//        ("AAS 100mg", "08:00", "8 em 8 horas"),
//        ("Alprazolam 0,5mg", "22:30", "Diariamente"),
//    ]
}
