import Foundation

/// Dominio base del reto: una billetera digital sencilla.
/// Esta es la "aplicación bajo prueba". El candidato debe escribir las pruebas
/// (BDD, unitarias y asíncronas) contra esta lógica.

/// Representa una cuenta de un cliente.
public struct Account: Equatable, Identifiable {
    public let id: String
    public let owner: String
    public private(set) var balance: Decimal

    public init(id: String, owner: String, balance: Decimal) {
        self.id = id
        self.owner = owner
        self.balance = balance
    }

    /// Acredita un monto a la cuenta.
    public mutating func credit(_ amount: Decimal) {
        balance += amount
    }

    /// Debita un monto de la cuenta.
    public mutating func debit(_ amount: Decimal) {
        balance -= amount
    }
}

/// Tipo de movimiento en el extracto.
public enum TransactionType: String, Equatable {
    case deposit
    case withdrawal
    case transfer
}

/// Un movimiento registrado en el extracto de la cuenta.
public struct Transaction: Equatable, Identifiable {
    public let id: String
    public let type: TransactionType
    public let amount: Decimal
    public let date: Date

    public init(id: String, type: TransactionType, amount: Decimal, date: Date) {
        self.id = id
        self.type = type
        self.amount = amount
        self.date = date
    }
}

/// Errores de dominio del servicio de transferencias.
public enum WalletError: Error, Equatable {
    case insufficientFunds
    case invalidAmount
    case accountNotFound
}
