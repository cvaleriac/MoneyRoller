infohash = {username: "Valeria", password: "1234"}
valeria = User.create(username: "Valeria", password: "1234")
brisa = User.create(username: "brisa", password: "1234")
Jack = User.create(username: "jack", password: "1234")
Tim = User.create (username: "tim", password: "1234")

rolloverhash = {amount: "1000", rollover_type: "incoming", origin_bank: "Chase", destination_bank: "City"}
Rollover.create(rolloverhash)
rollover2 = Rollover.create(amount: "100", rollover_type: "outgoing", origin_bank: "Chase", destination_bank: "City")
valeria.rollovers << rollover2
rollover3 = Rollover.create(amount: "1000", rollover_type: "incoming", origin_bank: "Alma Bank", destination_bank: "Bank of America")
rollover4 = Rollover.create (amount:"500", rollover_type: "outgoing", origin_bank: "Bank of America", destination_bank: "SantAnder")

jack.rollovers << rollover3
valeria.rollovers << rollover3
brisa.rollovers << rollover2
brisa.rollovers << rollover4
