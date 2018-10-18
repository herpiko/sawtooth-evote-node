### IP and Port pattern

#### National

Port :

1 - ledger by network : national(1)
1 - ledger by tp family : dpt(1), vote(2)
1 - bind type : network(1), component(2), or restapi(3)
3 - first str of province code
2 - second str of province code

#### TPS

Port :

2 - ledger by network : local(2)
1 - ledger by tp family : dpt(1), vote(2)
1 - bind type : network(1), component(2), or restapi(3)
1 - tpsId
1 - instanceId

IP :

1 - ledger by tp family : dpt(1), vote(2)
1 - tps id
1 - machine id

The ports used in a TPS that consists of 3 pairs of ledgers :

- TPS 1 (network : tps1)
  - TPS Machine 1
    - DPT : `21111`
    - Vote : `22111`
  - TPS Machine 2
    - DPT : `21112`
    - Vote : `22112`
  - TPS Machine 3
    - DPT : `21113`
    - Vote : `22113`
- TPS 2 (network : tps2)
  - TPS Machine 1
    - DPT : `21121`
    - Vote : `22121`
  - TPS Machine 2
    - DPT : `21122`
    - Vote : `22122`
  - TPS Machine 3
    - DPT : `21123`
    - Vote : `22123`
