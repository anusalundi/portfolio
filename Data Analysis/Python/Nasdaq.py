# Data https://nasdaqcsd.com/statistics/estonia/en/capitalization/auc/?year_month=2024-06&market=EE&currency=EUR

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import openpyxl
import numpy as np

df = pd.read_excel('/content/Yl2 (version 1).xlsb.xlsx', sheet_name='General')

pivot = pd.pivot_table(
    df,
    values='MEUR',  
    index=['Country', 'Participant name'],  
    columns=['Year', 'Quarter'],  
    aggfunc='sum',  
    fill_value=0   
)

print(pivot)

https://github.com/anusalundi/portfolio/issues/1#issue-2783889679

![1](https://github.com/user-attachments/assets/ced76158-560a-482e-88e9-45e3d10490a7)
