# Data IMPORT
import seaborn as sns
import pandas as pd

titanic_data = sns.load_dataset('titanic')
titanic_data.head()

# Data INVESTIGATION
titanic_data.isnull().sum() # checking null values
titanic_data.dtypes # checking data types
titanic_data.drop('deck', axis=1, inplace=True) # dropping deck column
titanic_data.drop(['alive', 'alone', 'adult_male'], axis=1, inplace=True)
titanic_data.drop('class', axis=1, inplace=True)

# Data TRANSFORMATION
titanic_data['class'] = titanic_data['class'].astype(str) # modified the object from category to string
titanic_data.fillna(0, inplace=True) # filling null values with 0
titanic_data.head()
titanic_data['sex'].unique()
titanic_data['who'].unique()

# Sex column
sex_mapping = {'male': 0, 'female': 1}
titanic_data['sex'] = titanic_data['sex'].map(sex_mapping)
titanic_data['embark_town'].unique()

# Embark town column
embark_town_mapping = {'Southampton': 1, 'Cherbourg': 2, 'Queenstown': 3, 0:0}
titanic_data['embark_town'] = titanic_data['embark_town'].map(embark_town_mapping)

# Embarked column
titanic_data['embarked'].unique()
embarked_mapping = {'S': 1, 'C': 2, 'Q': 3, 0:0}
titanic_data['embarked'] = titanic_data['embarked'].map(embarked_mapping)

# Who column
titanic_data['who'].unique()
who_mapping = {'man': 0, 'woman': 1, 'child': 2}
titanic_data['who'] = titanic_data['who'].map(who_mapping)
titanic_data.head()
titanic_data.info()

# Data MODELING
from re import X
from sklearn.model_selection import train_test_split
X = titanic_data.drop('survived', axis=1) #Features
y = titanic_data['survived'] #dependent variable
X_train, X_test, y_train, y_test = train_test_split(X, y, train_size=0.7, random_state=42)

# Logistic regression
from sklearn.linear_model import LogisticRegression # import
model = LogisticRegression() # create model
model.fit(X_train, y_train) # train model
prediction_results = model.predict(X_test) # predict
prediction_results

from sklearn.tree import DecisionTreeClassifier

tree_model = DecisionTreeClassifier(random_state=42)
tree_model.fit(X_train, y_train)
tree_predictions = tree_model.predict(X_test)
tree_predictions
