infohash = {username: "Valeria", password: "1234"}
valeria = User.create(username: "Valeria", password: "1234")
brisa = User.create(username: "brisa", password: "1234")
Jack = User.create(username: "jack", password: "1234")

rolloverhash = {amount: "1000", rollover_type: "incoming", user_id: valeria.id, origin_bank: "Chase", destination_bank: "City"}
Rollover.create(rolloverhash)
rollover2 = Rollover.create(amount: "100", rollover_type: "outgoing", origin_bank: "Chase", destination_bank: "City")
valeria.rollovers << rollover2
rollover3 = Rollover.create(amount: "1000", rollover_type: "incoming", origin_bank: "Alma Bank", destination_bank: "Bank of America")
jack.rollovers << rollover3
brisa.rollovers << rollover2
