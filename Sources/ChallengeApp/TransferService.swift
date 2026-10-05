import Foundation

/// Lógica de negocio síncrona: validación y ejecución de transferencias.
///
/// Buen candidato para pruebas unitarias (Fase 2) y para escenarios BDD
/// (Fase 1): "Dado un saldo suficiente, Cuando transfiero, Entonces...".
public struct TransferService {

    public init() {}

    /// Valida que un monto sea apto para transferir.
    /// - Throws: `WalletError.invalidAmount` si el monto es cero o negativo.
    public func validate(amount: Decimal) throws {
        if amount <= 0 {
            throw WalletError.invalidAmount
        }
    }

    /// Ejecuta una transferencia entre dos cuentas.
    /// - Returns: las cuentas actualizadas (origen, destino).
    /// - Throws: `WalletError.invalidAmount` o `WalletError.insufficientFunds`.
    public func transfer(
        amount: Decimal,
        from source: Account,
        to destination: Account
    ) throws -> (source: Account, destination: Account) {
        try validate(amount: amount)

        guard source.balance >= amount else {
            throw WalletError.insufficientFunds
        }

        var updatedSource = source
        var updatedDestination = destination
        updatedSource.debit(amount)
        updatedDestination.credit(amount)

        return (updatedSource, updatedDestination)
    }
}
