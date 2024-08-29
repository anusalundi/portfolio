import datetime
import json

class Client:
    def __init__(self, id, name):
        self.id = id
        self.name = name
        self.transactions = []

    def make_purchase(self, transaction):
        self.transactions.append(transaction)

    def to_dict(self):
        return {
            'id': self.id,
            'name': self.name,
            'transactions': [transaction.to_dict() for transaction in self.transactions]
        }

class Item:
    def __init__(self, id, name, price):
        self.id = id
        self.name = name
        self.price = price

    def to_dict(self):
        return {
            'id': self.id,
            'name': self.name,
            'price': self.price
        }

class Transaction:
    def __init__(self, client_id, items):
        self.client_id = client_id
        self.items = items
        self.time_stamp = datetime.datetime.now()

    def to_dict(self):
        return {
            'client_id': self.client_id,
            'items': [item.to_dict() for item in self.items],
            'time_stamp': self.time_stamp.isoformat()
        }

clients = []
clients.append(Client('123654', 'Anna'))
clients.append(Client('987456', 'Oskar'))
clients.append(Client('456987', 'Jenifer'))

items = []
items.append(Item('001', 'Dress', 39.99))
items.append(Item('002', 'Suit', 299.99))
items.append(Item('003', 'Hat', 35.00))
items.append(Item('004', 'Shirt', 17.49))

clients[0].make_purchase(Transaction(clients[0].id, [items[0], items[2], items[3]]))
clients[1].make_purchase(Transaction(clients[1].id, [items[1]]))
clients[2].make_purchase(Transaction(clients[2].id, [items[0], items[2], items[3]]))

clients_data = [client.to_dict() for client in clients]

with open("clients_data.json", "w") as outfile:
    json.dump(clients_data, outfile, indent=4)

for client in clients:
    print(f"Client: {client.name}")
    for transaction in client.transactions:
        print(f"  Transaction at {transaction.time_stamp}")
        for item in transaction.items:
            print(f"    Item: {item.name} - €{item.price}")
