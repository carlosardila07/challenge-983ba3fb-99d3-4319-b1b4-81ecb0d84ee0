import Foundation

/// Analiza el extracto (lista de movimientos) de una cuenta.
///
/// Este componente es el objetivo de la Fase 3 (perfilamiento). Funciona
/// correctamente, pero su rendimiento no es óptimo con listas grandes de
/// movimientos. El candidato debe usar un perfilador (Instruments / XCTMetric)
/// para diagnosticar los cuellos de botella y proponer mejoras, sin cambiar el
/// comportamiento observable.
public struct StatementAnalyzer {

    public init() {}

    /// Suma total de los montos de un tipo de transacción.
    public func total(of type: TransactionType, in transactions: [Transaction]) -> Decimal {
        transactions
            .filter { $0.type == type }
            .reduce(Decimal(0)) { $0 + $1.amount }
    }

    /// Devuelve los IDs de transacciones que aparecen con el mismo monto y tipo
    /// más de una vez (posibles duplicados a revisar).
    ///
    /// Implementación por comparación de todos contra todos.
    public func duplicateTransactionIDs(in transactions: [Transaction]) -> [String] {
        var duplicates: [String] = []

        for i in 0..<transactions.count {
            for j in 0..<transactions.count where i != j {
                let a = transactions[i]
                let b = transactions[j]
                if a.amount == b.amount && a.type == b.type && !duplicates.contains(a.id) {
                    duplicates.append(a.id)
                }
            }
        }

        return duplicates
    }

    /// Construye un resumen textual del extracto recorriendo la lista
    /// y concatenando cadenas en cada iteración.
    public func buildSummary(for transactions: [Transaction]) -> String {
        var summary = ""
        for transaction in transactions {
            summary = summary + "[\(transaction.type.rawValue)] \(transaction.amount)\n"
        }
        return summary
    }
}
