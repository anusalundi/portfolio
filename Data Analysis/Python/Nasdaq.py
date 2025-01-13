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

styled_pivot = pivot.style.format("{:.2f}")  
styled_pivot = styled_pivot.background_gradient(cmap="viridis")  
styled_pivot = styled_pivot.set_table_styles([{
    'selector': 'th',
    'props': [('font-weight', 'bold'), ('text-align', 'center')]
}])

styled_pivot

df['Quarter'] = df['Year'].astype(str) + ' - ' + df['Quarter']
df['Country-Participant'] = df['Country'] + ' - ' + df['Participant name']

plt.figure(figsize=(20, 12))
sns.barplot(
    data=df, 
    x='Country-Participant', 
    y='MEUR', 
    hue='Quarter', 
    dodge=True, 
    palette='viridis'
)

plt.title('Participant MEUR Volumes by Quarter and Country', fontsize=16)
plt.xlabel('Participants by Country', fontsize=14)
plt.ylabel('Sum of MEUR (in millions)', fontsize=14)
plt.xticks(rotation=45, fontsize=10, ha='right')
plt.legend(title='Quarters', fontsize=10, labels=["2023 - Q1", "2023 - Q2", "2023 - Q3", "2023 - Q4", "2024 - Q1", "2024 - Q2", "2024 - Q3"]) # , labels=["2023 - Q1", "2023 - Q2", "2023 - Q3", "2023 - Q4", "2024 - Q1", "2024 - Q2", "2024 - Q3"]

countries = df['Country'].unique()
offset = 0
for country in countries:
    country_data = df[df['Country'] == country]
    participant_count = len(country_data['Participant name'].unique())
        
        plt.text(
        x=offset + participant_count / 2 - 0.5, 
        y=df['MEUR'].median() * 2, 
        s=country, 
        ha='center', fontsize=14, color='grey'
    )
    
       plt.axvline(
        x=offset + participant_count - 0.5, 
        color='gray', linestyle='--', alpha=0.7
    )
    
    offset += participant_count

plt.tight_layout()
plt.show()

wb = openpyxl.load_workbook('/content/Yl2 (version 1).xlsb.xlsx')
sheet = wb['new Pivot']

df_filtered = df[df['Participant name'] != 'Other participants, total']
df_grouped = df_filtered.groupby('Participant name')['MEUR'].sum().sort_values(ascending=False)

top_7 = df_grouped.head(7)

colors = plt.cm.viridis(np.linspace(0, 1, len(top_7)))

plt.figure(figsize=(8, 8))
top_7.plot(kind='pie', autopct='%1.1f%%', startangle=90, legend=False, colors=colors)

plt.title('Top 7 Participants by Percent')
plt.ylabel('')  
plt.show()
