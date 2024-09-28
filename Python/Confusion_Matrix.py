import seaborn as sns
import pandas as pd 

titanic_data = sns.load_dataset('titanic')

print("Number of passangers:",len(titanic_data))
titanic_data.columns 
titanic_data.dtypes 

titanic_data['class'].unique()

titanic_data.isnull().sum()

titanic_data['deck'] = titanic_data['deck'].astype(str) 
titanic_data['class'] = titanic_data['class'].astype(str)
titanic_data.fillna(0, inplace=True)
titanic_data.drop(['alive', 'alone', 'adult_male', 'deck'], axis=1, inplace=True)

titanic_data.isnull().sum()

titanic_data['embark_town'].unique()

# Mapping for embark_town
embark_town_mapping = {'Southampton': 1, 'Cherbourg': 2, 'Queenstown': 3, 0:0}
titanic_data['embark_town'] = titanic_data['embark_town'].map(embark_town_mapping)

# Mapping for sex
sex_mapping = {'male': 0, 'female': 1}
titanic_data['sex'] = titanic_data['sex'].map(sex_mapping)

# Mapping for embarked
embarked_mapping = {'S': 1, 'C': 2, 'Q': 3, 0 : 0}
titanic_data['embarked'] = titanic_data['embarked'].map(embarked_mapping)

# Mapping for class
class_mapping = {'Third': 1, 'First': 2, 'Second': 3}
titanic_data['class'] = titanic_data['class'].map(class_mapping)

# Mapping for who
who_mapping = {'man': 1, 'woman': 2, 'child': 3}
titanic_data['who'] = titanic_data['who'].map(who_mapping)

titanic_data.isnull().sum() #NO MORE EMPTY VALUES

from sklearn.model_selection import train_test_split

X = titanic_data.drop('survived', axis=1) #Independent variables
y = titanic_data['survived'] #Dependent variable

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2 )

from sklearn.neighbors import KNeighborsClassifier # import the model

model = KNeighborsClassifier() # create an instance of the model

model.fit(X_train, y_train) # train the model

prediction_knn = model.predict(X_test) # make predictions on the test set

from sklearn.metrics import accuracy_score

accuracy_score(prediction_knn, y_test)

# Confusion matrix

from sklearn.metrics import confusion_matrix

cm = confusion_matrix(y_test, prediction_knn)

print (cm)

import seaborn as sns
import matplotlib.pyplot as plt

# visualize a heatmap from cm using seaborn
sns.heatmap(cm, annot=True, cmap='Purples', fmt='d')
plt.title('Confusion matrix')
plt.xlabel('Predicted')
plt.ylabel('Actual')
plt.show()
