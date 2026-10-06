import XCTest
@testable import ChallengeApp

final class AsyncUnitTests: XCTestCase {

    private func makeRepository(
        accounts: [Account],
        transactions: [String: [Transaction]] = [:]
    ) -> InMemoryAccountRepository {
        InMemoryAccountRepository(
            accounts: accounts,
            transactions: transactions,
            latencyNanoseconds: 0
        )
    }

    func test_fetchAccount_devuelveLaCuentaEsperada() async throws {
        let repo = makeRepository(
            accounts: [Account(id: "1", owner: "Ada", balance: 100)]
        )

        let account = try await repo.fetchAccount(id: "1")

        XCTAssertEqual(account.id, "1")
        XCTAssertEqual(account.owner, "Ada")
        XCTAssertEqual(account.balance, 100)
    }

    func test_fetchAccount_lanzaAccountNotFound() async {
        let repo = makeRepository(
            accounts: [Account(id: "1", owner: "Ada", balance: 100)]
        )

        do {
            _ = try await repo.fetchAccount(id: "999")
            XCTFail("Se esperaba un error accountNotFound")
        } catch {
            XCTAssertEqual(error as? WalletError, .accountNotFound)
        }
    }

    func test_fetchTransactions_devuelveLosMovimientosEsperados() async throws {
        let movimientos = [
            Transaction(id: "a", type: .deposit, amount: 100, date: Date()),
            Transaction(id: "b", type: .withdrawal, amount: 30, date: Date())
        ]
        let repo = makeRepository(
            accounts: [Account(id: "1", owner: "Ada", balance: 100)],
            transactions: ["1": movimientos]
        )

        let result = try await repo.fetchTransactions(accountId: "1")

        XCTAssertEqual(result, movimientos)
    }

    func test_fetchTransactions_devuelveVacioSiNoHayMovimientos() async throws {
        let repo = makeRepository(
            accounts: [Account(id: "1", owner: "Ada", balance: 100)]
        )

        let result = try await repo.fetchTransactions(accountId: "1")

        XCTAssertTrue(result.isEmpty)
    }

    func test_fetchTransactions_lanzaAccountNotFound() async {
        let repo = makeRepository(
            accounts: [Account(id: "1", owner: "Ada", balance: 100)]
        )

        do {
            _ = try await repo.fetchTransactions(accountId: "999")
            XCTFail("Se esperaba un error accountNotFound")
        } catch {
            XCTAssertEqual(error as? WalletError, .accountNotFound)
        }
    }
}
