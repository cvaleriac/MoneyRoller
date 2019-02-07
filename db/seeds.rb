infohash = {username: "Valeria", password: "1234"}
valeria = User.create(username: "Valeria", password: "1234")
brisa = User.create(username: "brisa", password: "1234")

rolloverhash = {amount: "1000", rollover_type: "incoming", user_id: valeria.id}
Rollover.create(rolloverhash)
rollover2 = Rollover.create(amount: "100", rollover_type: "outgoing")
valeria.rollovers << rollover2
