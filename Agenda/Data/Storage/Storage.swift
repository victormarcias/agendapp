//
//  Storage.swift
//  Agenda
//
//  Created by Victor Marcias on 01/09/2024.
//

import Foundation

struct Storage {

    /// Método para leer objetos `Int`, `String`, `Data` o cualquier `Codable`
    func object<T: Decodable>(for key: StorageKey) -> T? {
        // Verifica si el tipo es Int
        if T.self == Int.self {
            return UserDefaults.standard.integer(forKey: key.rawValue) as? T
        }
        // Verifica si el tipo es String
        if T.self == String.self {
            return UserDefaults.standard.string(forKey: key.rawValue) as? T
        }
        // Verifica si el tipo es Data
        if T.self == Data.self {
            return UserDefaults.standard.data(forKey: key.rawValue) as? T
        }
        // Para otros tipos que sean Decodable
        if let data = UserDefaults.standard.data(forKey: key.rawValue) {
            return try? JSONDecoder().decode(T.self, from: data)
        }
        
        return nil
    }
    
    /// Método para guardar Encodables
    func save<T: Encodable>(_ item: T, for key: StorageKey) {
        if let encoded = try? JSONEncoder().encode(item) {
            UserDefaults.standard.set(encoded, forKey: key.rawValue)
            UserDefaults.standard.synchronize()
        } else {
            print("Failed to save \(item) with key: \(key.rawValue)")
        }
    }
    
    /// Método para borrar el contenido
    func erase(_ key: StorageKey) {
        UserDefaults.standard.set(nil, forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
}

// MARK: - Enums
extension Storage {
    
    /// Método genérico para obtener un `enum` desde `UserDefaults`
    func enumValue<T: RawRepresentable>(for key: StorageKey) -> T? where T.RawValue: LosslessStringConvertible {
        // Primero intenta con `String`
        if let stringValue = UserDefaults.standard.string(forKey: key.rawValue),
           let rawValue = T.RawValue(stringValue) {
            return T(rawValue: rawValue)
        }
        
        // Luego intenta con `Int` (u otro tipo `LosslessStringConvertible`)
        if let value = UserDefaults.standard.value(forKey: key.rawValue) as? T.RawValue {
            return T(rawValue: value)
        }
        
        return nil
    }
    
    /// Método genérico para guardar un `enum` en `UserDefaults`
    func saveEnumValue<T: RawRepresentable>(_ value: T, for key: StorageKey) where T.RawValue: LosslessStringConvertible {
        // Guardar el valor crudo del `enum` en `UserDefaults`
        UserDefaults.standard.set(value.rawValue, forKey: key.rawValue)
        UserDefaults.standard.synchronize()
    }
}
