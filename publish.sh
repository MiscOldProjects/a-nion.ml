#

tic=$(date +%s)
qm=$(ipfs add -Q -r . --hash sha3-224 --cid-base=base58btc)
echo qm: $qm
echo $tic: $qm >> qm.log
bafy=$(ipfs cid base32 $qm)
echo bafy: http://$bafy.ipfs.dweb.link/
echo $bafy.ipfs.dweb.link >> CNAME
echo cf: https://cloudflare-ipfs.com/ipfs/$qm
echo url: https://$bafy.cf-ipfs.com/

ipfs files mkdir -p /public/u-nion/landing
ipfs files rm -r /public/u-nion/landing
ipfs files cp /ipfs/$qm /public/u-nion/landing
qm=$(ipfs files stat --hash /public/u-nion)
echo files: https://gateway.ipfs.io/ipfs/$qm/landing/
qm32=$(ipfs cid base32 $qm)
echo files: https://$qm32.cf-ipfs.com/landing/

