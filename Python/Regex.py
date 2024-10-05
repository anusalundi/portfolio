import re # regular expression module

text string with multiple lines

text = """ 
Alice: 555-123-4567
Bob: 333-987-6543
Charlie: 777-555-88
"""

text
# correct format is 3-3-4

# Define the regex pattern for phone numbers in the 3-3-4 format
pattern = r'\d{3}-\d{3}-\d{4}'

# Find all matches using the regex pattern
matches = re.findall(pattern, text)

# required output: 555-123-4567, 333-987-6543
print(matches)

# re.search - first occurance of a pattern
# re.findall - finds all the occurances
# re.IGNORECAE - pattern matching is cae-insensitive

### Dates pattern matching

dates = """
My dates are: 05-10-2024 and 2022-10-05
"""

pattern2 = r'\d{2}-\d{2}-\d{4}'
matches2 = re.findall(pattern2, dates)
print(matches2)

### E-mail addresses matching

email = """
Emails: liza@example.com, roberta@gmail.com, info@company.net
"""

pattern3 = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'
matches3 = re.findall(pattern3, email)
print(matches3)

email2 = """
Emails: l.iza@example.com, rober.ta@gmail.com, i.nfo@company.ee"""

pattern4 = r'[\w.-]+@[\w.-]+\.\w+'

matches4 = re.findall(pattern4, email2)

print(matches4)
