const HDWalletProvider = require('truffle-hdwallet-provider');
const infuraKey = "v3/12e8d56547c1422aaf3d12f28b43e632";
//
const fs = require('fs');
const mnemonic = fs.readFileSync(".secret").toString().trim();

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 9545,
      network_id: "*" // Match any network id
    },
    rinkeby: {
      provider: function() { 
       return new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/"+infuraKey);

      },
      gas: 4500000,
      gasPrice: 10000000000,
      network_id: 4
    } 
  },
  mocha: {
    timeout: 100000
  },
  compilers: {
    solc: {
      version: "^0.4.24"
    }
  }
};