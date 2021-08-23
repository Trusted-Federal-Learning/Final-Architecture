import requests
url = "http://localhost:8545"

data = '{"jsonrpc":"2.0","method":"eth_getTransactionByBlockNumberAndIndex","params":["0xc","0x0"],"id":18}'
r = requests.post(url,data)
print(r.text)