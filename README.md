# Reproduce a bug with stuck transaction on miner restart

Contains two nodes a client & a miner

To reproduce the bug
1. Start both miner & client
2. Run a transaction to see that miner actually mine
 ``` eth.sendTransaction({from:"0x8a3f8237665609dce3886fc863101a34c34c71e7",to:"0x9df6b679e62233d25c51577e6aa5d96946ca49aa",value:web3.toWei("0.1","ether")})```  
    Check that there are no waiting transactions   
 ```eth.getBlock('pending')```
3. Stop the miner
4. Run another transaction and check that it is waiting to be mined  
5. Start the miner again - the transaction is not mined   