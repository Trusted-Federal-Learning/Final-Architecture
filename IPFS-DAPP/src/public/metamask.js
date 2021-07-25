function isMetaMaskInstalled(){
    if (typeof window.ethereum !== 'undefined') {
        console.log('MetaMask is installed!');
    }else {
        console.log('MetaMask detected Failed!');
        window.alert('Please install/update MetaMask first!');
    }
    const { ethereum } = window;
    return Boolean(ethereum && ethereum.isMetaMask);
}
// check if Metamask has been installed


async function sendTrans(){
    if(isMetaMaskInstalled()){
        
        if (window.ethereum) {
            try {
              const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' });
              setAccounts(accounts);
            } catch (error) {
              if (error.code === 4001) {
                // User rejected request
                console.log('User rejected request!')
              }
              console.log(error)
            }
          }
    }
}

sendTrans()
