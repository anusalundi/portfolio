import numpy as np
import matplotlib.pyplot as plt

# Define the possible outcomes for a single coin
coin = ["Heads", "Tails"]

# Function to simulate coin toss and calculate frequencies and probabilities
def simulate_coin_toss(trials):
    tosses_1 = np.random.choice(coin, trials)  # First coin
    tosses_2 = np.random.choice(coin, trials)  # Second coin
    combined_tosses = np.core.defchararray.add(tosses_1, tosses_2)

    # Calculate occurrences for each outcome
    num_HH = np.sum(combined_tosses == "HeadsHeads")
    num_HT = np.sum(combined_tosses == "HeadsTails")
    num_TH = np.sum(combined_tosses == "TailsHeads")
    num_TT = np.sum(combined_tosses == "TailsTails")

    return [num_HH, num_HT, num_TH, num_TT], [num_HH/trials, num_HT/trials, num_TH/trials, num_TT/trials]

# Function to visualize the results using bar chart
def visualize_results(frequencies, probabilities, trials):
    outcomes = ['HH', 'HT', 'TH', 'TT']

    # Bar chart for frequencies
    plt.figure(figsize=(10, 5))
    plt.subplot(1, 2, 1)
    plt.bar(outcomes, frequencies, color=['skyblue','lightblue', 'lightgreen', 'green'])
    plt.title(f'Frequencies for {trials} Trials')
    plt.xlabel('Outcomes')
    plt.ylabel('Frequency')

    plt.show()

# Simulate the coin toss for multiple trials (100, 500, 1000)
trial_counts = [100, 500, 1000]
for trials in trial_counts:
    frequencies, probabilities = simulate_coin_toss(trials)
    print(f"Results for {trials} trials:")
    print(f"Frequencies: {frequencies}")
    print(f"Probabilities: {probabilities}")
    
    # Visualize the results
    visualize_results(frequencies, probabilities, trials)

# Theoretical probabilities (since each outcome has a 1/4 chance)
theoretical_probabilities = [0.25, 0.25, 0.25, 0.25]
print("\nTheoretical probabilities (HH, HT, TH, TT):", theoretical_probabilities)
