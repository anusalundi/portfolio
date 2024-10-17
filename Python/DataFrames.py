import numpy as np
import pandas as pd

df = pd.DataFrame({
    'Population': [35.467, 63.951, 80.94, 60.665, 127.061, 64.511, 318.523],
    'GDP': [
        1785387,
        2833687,
        3874430,
        216774,
        4602367,
        2950039,
        17348075
    ],
    'Surface Area': [
        9984670,
        640679,
        357114,
        301336,
        377930,
        242495,
        9525067
    ],
    'HDI': [
        0.913,
        0.888,
        0.916,
        0.873,
        0.891,
        0.907,
        0.915
    ],
    'Continent': [
        'America',
        'Europe',
        'Europe',
        'Europe',
        'Asia',
        'Europe',
        'America'
    ]
}, columns=['Population', 'GDP', 'Surface Area', 'HDI', 'Continent'])

df

df.index = [
    'Canada',
    'France',
    'Germany',
    'Italy',
    'Japan',
    'United Kingdom',
    'United States',
]

df
df.columns
df.index
df.info()
df.size
df.shape
df.describe()
df.dtypes
df.dtypes.value_counts()

## Indexing, Selection and Slicing
df['Population']
df['Population'].to_frame()
df[['Population', 'GDP']]
df[1:3]
df.loc['Italy']
df.iloc[3]
df['Population']
df.loc['France': 'Italy']
df.loc['France': 'Italy', 'Population']
df.loc['France': 'Italy', ['Population', 'GDP']]
df.iloc[1:3, 3]
df.iloc[1:3, [0, 3]]
df.iloc[1:3, 1:3]
df.iloc[1:3, 1:3].to_numpy()
df.iloc[1:3, 1:3].values
df.iloc[1:3, 1:3].to_dict()
df.iloc[1:3, 1:3].to_json()
df.iloc[1:3, 1:3].to_csv('test.csv')

df.loc[df['Population'] > 70]

## Conditional selection (boolean arrays)
df
df['Population'] > 70
df.loc[df['Population'] > 70]
df.loc[df['Population'] > 70, 'Population']
df.loc[df['Population'] > 70, ['Population', 'GDP']]

## Dropping stuff
df.drop('Canada')
df.drop(['Canada', 'Japan'])
df.drop(columns=['Population', 'HDI'])
df.drop(['Italy', 'Canada'], axis=0)
df.drop(['Population', 'HDI'], axis=1)
df.drop(['Population', 'HDI'], axis=1)
df.drop(['Population', 'HDI'], axis='columns')
df.drop(['Canada'], axis='rows')

## Operations
df[['Population', 'GDP']]
df[['Population', 'GDP']] / 100

crisis = pd.Series([-1_000_000, -0.3], index=['GDP', 'HDI'])
crisis

df[['GDP', 'HDI']]
df[['GDP', 'HDI']] + crisis
