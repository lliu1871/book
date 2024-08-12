---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.11.5
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---


# Lab 13: Reinforcement Learning


## Taxi 

```{code-cell}
import gym
env = gym.make("Taxi-v3",render_mode="rgb_array").env
env.reset() # reset environment to a new, random state
env.render()

print("Action Space {}".format(env.action_space))
print("State Space {}".format(env.observation_space))
```
```{code-cell}
state = env.encode(3, 1, 2, 0) # (taxi row, taxi column, passenger index, destination index)
print("State:", state)

env.s = state
env.render()
```

```{code-cell}
#Since every state is in this matrix, we can see the default reward values assigned to our illustration's state:
env.P[328]
```

## Solving the environment without Reinforcement Learning

```{code-cell}
env.s = 328  # set environment to illustration's state
epochs = 0
penalties, reward = 0, 0
frames = [] # for animation
done = False

while not done:
    action = env.action_space.sample()
    state, reward, done, info, _ = env.step(action)
    if reward == -10:
        penalties += 1   
    # Put each rendered frame into dict for animation
    frames.append({
        'frame': env.render(),
        'state': state,
        'action': action,
        'reward': reward
        }
    )
    epochs += 1
    
    
print("Timesteps taken: {}".format(epochs))
print("Penalties incurred: {}".format(penalties))
```

```{code-cell}
from IPython.display import clear_output
from time import sleep

def print_frames(frames):
    for i, frame in enumerate(frames):
        clear_output(wait=True)
        print(frame['frame'])
        print(f"Timestep: {i + 1}")
        print(f"State: {frame['state']}")
        print(f"Action: {frame['action']}")
        print(f"Reward: {frame['reward']}")
        sleep(.1)
               
print_frames(frames)
```

## Solving the enviroment with reinforcement learning
```{code-cell}
import numpy as np
import gym
import random

# Initialize the FrozenLake environment
env = gym.make("FrozenLake-v1", is_slippery=True)

# Define Q-table and parameters
action_space_size = env.action_space.n
state_space_size = env.observation_space.n
q_table = np.zeros((state_space_size, action_space_size))

# Hyperparameters
num_episodes = 10000
max_steps_per_episode = 100

learning_rate = 0.1
discount_rate = 0.99
exploration_rate = 1.0
max_exploration_rate = 1.0
min_exploration_rate = 0.01
exploration_decay_rate = 0.001

# Training the agent
for episode in range(num_episodes):
    state = env.reset()
    done = False
    for step in range(max_steps_per_episode):
        # Exploration-exploitation trade-off
        exploration_threshold = random.uniform(0, 1)
        if exploration_threshold > exploration_rate:
            action = np.argmax(q_table[state, :])
        else:
            action = env.action_space.sample()

        # Take action and observe the reward
        new_state, reward, done, info, _ = env.step(action)

        # Update Q-table
        q_table[state, action] = q_table[state, action] * (1 - learning_rate) + \
            learning_rate * (reward + discount_rate * np.max(q_table[new_state, :]))

        state = new_state

        if done:
            break

    # Exploration rate decay
    exploration_rate = min_exploration_rate + \
        (max_exploration_rate - min_exploration_rate) * np.exp(-exploration_decay_rate * episode)

# Test the agent
num_test_episodes = 10
for episode in range(num_test_episodes):
    state = env.reset()
    done = False
    print(f"Episode {episode + 1}:\n\n")
    for step in range(max_steps_per_episode):
        env.render()
        action = np.argmax(q_table[state, :])
        new_state, reward, done, info, _ = env.step(action)
        state = new_state
        if done:
            if reward == 1:
                print("Reached the goal!")
            else:
                print("Fell into a hole!")
            break

env.close()
```

```{code-cell}
import numpy as np
q_table = np.zeros([env.observation_space.n, env.action_space.n])

import random
from IPython.display import clear_output

# Hyperparameters
alpha = 0.1
gamma = 0.6
epsilon = 0.1

# For plotting metrics
all_epochs = []
all_penalties = []

for i in range(1, 10000):
    state = env.reset()

    epochs, penalties, reward, = 0, 0, 0
    done = False
    
    while not done:
        if random.uniform(0, 1) < epsilon:
            action = env.action_space.sample() # Explore action space
        else:
            action = np.argmax(q_table[state]) # Exploit learned values

        next_state, reward, done, info, _ = env.step(action) 
        
        old_value = q_table[state[0], action]
        next_max = np.max(q_table[next_state])
        
        new_value = (1 - alpha) * old_value + alpha * (reward + gamma * next_max)
        q_table[state[0], action] = new_value

        if reward == -10:
            penalties += 1

        state = next_state
        epochs += 1
        
    if i % 100 == 0:
        clear_output(wait=True)
        print(f"Episode: {i}")

print("Training finished.\n")
```

### Q-table has been established over 1000 episodes

```{code-cell}
q_table[328]
```

### Using Q-table

```{code-cell}
env.s = 328  # set environment to illustration's state

epochs = 0
penalties, reward = 0, 0

frames = [] # for animation

done = False

while not done:
    #action = env.action_space.sample()
    #state, reward, done, info = env.step(action)
    action = np.argmax(q_table[env.s])
    state, reward, done, info, _ = env.step(action)

    if reward == -10:
        penalties += 1
    
    # Put each rendered frame into dict for animation
    frames.append({
        'frame': env.render(mode='ansi'),
        'state': state,
        'action': action,
        'reward': reward
        }
    )
    epochs += 1

print_frames(frames)
```

## Evaluation of performance

```{code-cell}
total_epochs, total_penalties = 0, 0
episodes = 100

for _ in range(episodes):
    state = env.reset()
    epochs, penalties, reward = 0, 0, 0
    
    done = False
    
    while not done:
        action = np.argmax(q_table[state[0]])
        state, reward, done, info, _ = env.step(action)

        if reward == -10:
            penalties += 1

        epochs += 1

    total_penalties += penalties
    total_epochs += epochs

print(f"Results after {episodes} episodes:")
print(f"Average timesteps per episode: {total_epochs / episodes}")
print(f"Average penalties per episode: {total_penalties / episodes}")
```


