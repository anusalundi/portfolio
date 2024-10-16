import pandas as pd
import numpy as np

g7_pop = pd.Series([35.467, 63.951, 80.940, 60.665, 127.06, 64.511, 318.523])
g7_pop
g7_pop.name = 'G7 Population in millions'
g7_pop
g7_pop.dtype
g7_pop.values
type(g7_pop.values)
g7_pop[0]
g7_pop.index

g7_pop.index = [
    'Canada',
    'France',
    'Germany',
    'Italy',
    'Japan',
    'United Kingdom',
    'United States',
]

g7_pop

pd.Series({
    'Canada': 35.467,
    'France': 63.951,
    'Germany': 80.94,
    'Italy': 60.665,
    'Japan': 127.06,
    'United Kingdom': 64.511,
    'United States': 318.523
}, name='G7 Population in millions')

## Indexing
g7_pop['Canada']
g7_pop.iloc[0]
g7_pop.iloc[-1]
g7_pop[['Italy', 'France']]
g7_pop.iloc[[0, 1]]
g7_pop['Canada': 'Italy']
