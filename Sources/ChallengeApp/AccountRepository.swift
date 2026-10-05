import Foundation

/// Fuente de datos asíncrona de cuentas y movimientos.
///
/// Pensado para la Fase 2 (pruebas unitarias de funcionalidades asíncronas):
/// el candidato debe probar estos métodos `async` usando `await`, verificando
/// tanto el camino feliz como el manejo de errores.
public protocol AccountDataSource {
    func fetchAccount(id: String) async throws -> Account
    func fetchTransactions(accountId: String) async throws -> [Transaction]
}

/// Implementación en memoria que simula latencia de red.
public struct InMemoryAccountRepository: AccountDataSource {

    private let accounts: [String: Account]
    private let transactions: [String: [Transaction]]
    private let latencyNanoseconds: UInt64

    public init(
        accounts: [Account],
        transactions: [String: [Transaction]] = [:],
        latencyNanoseconds: UInt64 = 10_000_000 // 10 ms
    ) {
        self.accounts = Dictionary(uniqueKeysWithValues: accounts.map { ($0.id, $0) })
        self.transactions = transactions
        self.latencyNanoseconds = latencyNanoseconds
    }

    public func fetchAccount(id: String) async throws -> Account {
        try await Task.sleep(nanoseconds: latencyNanoseconds)
        guard let account = accounts[id] else {
            throw WalletError.accountNotFound
        }
        return account
    }

    public func fetchTransactions(accountId: String) async throws -> [Transaction] {
        try await Task.sleep(nanoseconds: latencyNanoseconds)
        guard accounts[accountId] != nil else {
            throw WalletError.accountNotFound
        }
        return transactions[accountId] ?? []
    }
}
