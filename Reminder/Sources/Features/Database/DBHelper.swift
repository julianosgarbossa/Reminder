//
//  DBHelper.swift
//  Reminder
//
//  Created by Juliano Sgarbossa on 12/02/25.
//

import Foundation
import SQLite3

class DBHelper {
    static let shared = DBHelper()
    private var db: OpaquePointer?
    
    private init() {
        self.openDatabase()
        self.createTable()
    }
    
    private func openDatabase() {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("reminder.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("Erro ao abrir o banco e dados")
            return
        }
    }
    
    private func createTable() {
        let createTableQuery = """
        CREATE TABLE IF NOT EXISTS Recipes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            remedy TEXT,
            time TEXT,
            recurrence TEXT,
            takeNow INTEGER);
        """
        
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, createTableQuery, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Sucesso ao criar a tabela")
            } else {
                print("Erro ao criar a tabela")
            }
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("Erro ao preparar a query criação da tabela: \(errorMessage)")
        }
        sqlite3_finalize(statement)
    }
    
    func insertRecipe(remedy: String, time: String, recurrence: String, takeNow: Bool) {
        let insertQuery = """
        INSERT INTO Recipes (
            remedy,
            time,
            recurrence,
            takeNow) VALUES (?, ?, ?, ?);
        """
        
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, insertQuery, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, (remedy as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (time as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 3, (recurrence as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 4, (takeNow ? 1 : 0))
            
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Receita inserida com sucesso")
            } else {
                print("Falha ao inserir a receita")
            }
        } else {
            let errorMessage = String(cString: sqlite3_errmsg(db))
            print("Erro ao preparar a query de inserção dos dados: \(errorMessage)")
        }
        sqlite3_finalize(statement)
    }
}


