import pandas as pd

file_path = 'prices.txt'
data = pd.read_csv(file_path, header=None, names=['Price'])

data = data[pd.to_numeric(data['Price'], errors='coerce').notnull()]

data['Price'] = data['Price'].astype(float)

total_price = data['Price'].sum()
total_items = data['Price'].count()

print(f'Total price of all items: {total_price:.2f}')
print(f'Total number of purchased items: {total_items}')
