import hashlib
def hashgenerator(data):
    result=hashlib.sha256(data.encode())
    return result.hexdigest()
class Crytoblock:
    def __init__(self,data,hash,hash_prev):
        self.data=data
        self.hash=hash
        self.hash_prev=hash_prev

class Blockchain:
    def __init__(self):
        hashstart=hashgenerator("startblockhash")
        hashprev=hashgenerator('prevblockhash')

        startblock=Crytoblock('block1',hashstart,hashprev)
        self.chain=[startblock]

    def add_Crytoblock(self,data):
        hash_prev=self.chain[-1].hash
        hash=hashgenerator(data+hash_prev)

        block=Crytoblock(data,hash,hash_prev)
        self.chain.append(block)

bc=Blockchain()
bc.add_Crytoblock("block2")
bc.add_Crytoblock("block3")
bc.add_Crytoblock("block4")
bc.add_Crytoblock("block5")

for block in bc.chain:
    print(block.__dict__)