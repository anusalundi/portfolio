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

## Conditional selection (boolean arrays / series)
g7_pop * 1_000_000
g7_pop > 70
g7_pop[g7_pop > 70]
g7_pop.mean()
g7_pop[g7_pop > g7_pop.mean()]
g7_pop.std()
g7_pop[(g7_pop > g7_pop.mean() - g7_pop.std() / 2) | (g7_pop > g7_pop.mean() + g7_pop.std() / 2)]

## Operations and methods
g7_pop
g7_pop * 1_000_000
g7_pop.mean()
np.log(g7_pop)
g7_pop['France': 'Italy'].mean()

## Boolean arrays
g7_pop
g7_pop > 80
g7_pop[g7_pop > 80]
g7_pop[(g7_pop > 80) | (g7_pop < 40)]
g7_pop[(g7_pop > 80) & (g7_pop < 200)]

## Modifying series
g7_pop['Canada'] = 40.5
g7_pop.iloc[-1] = 500
g7_pop
g7_pop[g7_pop < 70] = 99.99
g7_pop
