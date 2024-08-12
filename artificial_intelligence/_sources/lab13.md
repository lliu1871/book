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

```{epigraph}
*"Do the difficult things while they are easy and do the great things while they are small. A journey of a thousand miles must begin with a single step."*
-- Lao Tzu
```

```{seealso}
- [Reinforcement learning at Wikipedia](https://en.wikipedia.org/wiki/Reinforcement_learning)
```

<iframe width="560" height="315" src="https://www.youtube.com/embed/yMk_XtIEzH8?si=X-dCm1-zSB27DcVP" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>


Reinforcement learning (RL) is a type of machine learning paradigm where an agent learns to make decisions by interacting with an environment. The agent learns to achieve a goal by receiving feedback in the form of rewards or penalties for its actions.

## Components of Reinforcement Learning

1. **Agent**: The entity that learns to interact with the environment. It makes decisions based on the information it receives from the environment.
   
2. **Environment**: The external system with which the agent interacts. It provides feedback to the agent based on its actions and possibly changes state accordingly.

3. **State**: A representation of the environment at a particular time. It captures all relevant information needed to make decisions.

4. **Action**: The choices available to the agent at each state. These actions lead to transitions to new states and potentially result in rewards or penalties.

5. **Reward**: Feedback provided to the agent after taking an action in a particular state. The goal of the agent is to maximize cumulative rewards over time.

## Key Concepts

- **Exploration vs. Exploitation**: Balancing between trying out new actions (exploration) and selecting actions that have yielded high rewards in the past (exploitation).
  
- **Policy**: A strategy or set of rules that the agent uses to select actions based on the current state.

- **Value Function**: A function that estimates the expected cumulative reward of taking a particular action in a particular state.

## Learning Process

1. **Initialization**: Initialize the agent, environment, and any necessary parameters.

2. **Interaction**: The agent interacts with the environment by taking actions based on its current state.

3. **Feedback**: The environment provides feedback in the form of rewards or penalties.

4. **Learning**: The agent updates its policy or value function based on the received feedback to improve its decision-making process.

5. **Repeat**: Iteratively interact, receive feedback, and update until the agent learns an optimal policy or converges to a satisfactory solution.

## Applications

- **Game Playing**: RL has been successfully applied to games like chess, Go, and video games.
  
- **Robotics**: RL enables robots to learn to perform complex tasks such as grasping objects or navigating environments.
  
- **Recommendation Systems**: RL can be used to optimize recommendations based on user interactions.

## Algorithms

Popular reinforcement learning algorithms include:
- **Q-Learning**
- **Deep Q-Networks (DQN)**
- **Policy Gradient Methods**
- **Actor-Critic Methods**

These algorithms vary in complexity and are suited to different types of problems.

Reinforcement learning offers a powerful framework for teaching agents to learn from experience and make decisions in complex environments.

## Reinforcement Learning with Q-Learning

### Introduction
Q-Learning is a model-free form of machine learning, where the AI "agent" learns through interaction with an environment without needing prior knowledge of its dynamics. This tutorial demonstrates the Q-learning algorithm using OpenAI's gym library.

### Algorithm Overview
1. **Initialization**: Initialize Q-table with zeros.
2. **Exploration vs. Exploitation**: Choose action based on an exploration-exploitation trade-off.
3. **Update Q-values**: Update Q-values based on observed rewards and transitions.
4. **Repeat**: Iterate through steps 2 and 3 until convergence.

### Environment Setup
We'll be using OpenAI's gym library, particularly the "MountainCar-v0" environment. Install gym using pip:

```bash
pip install gym
```

Most basic gym environments follow a similar structure: initialize the environment with gym.make(NAME), reset the environment with env.reset(), then iterate through a loop where you perform an action with env.step(ACTION) on each iteration. 

- Initialize environment: `env = gym.make('MountainCar-v0')`
- Reset environment: `state = env.reset()`
- Iterate through environment steps: `next_state, reward, done, info = env.step(action)`

### MountainCar
In this MountainCar example, there are three actions - move left (0), stay still (1), and move right (2). 

```{code-cell}
import gym
env = gym.make("MountainCar-v0")
print(env.action_space.n)
```

When we step the environment, we can pass a 0, 1, or 2 as our "action" for each step. Each time we do this, the environment will return to us the new state and a reward.

```{code-cell}
import gym

env = gym.make("MountainCar-v0", render_mode="rgb_array")
env.reset()

done = False
stepsize = 0
while not done:
    action = 2  # always go right!
    env.step(action)
    env.render()
    stepsize = stepsize+1
    if stepsize > 100:
      break
```

As you can see, despite asking this car to go right constantly, we can see that it just doesn't quite have the power to make it. Instead, we need to actually build momentum here to reach that flag. To do that, we'd want to move back and forth to build up momentum. We could program a function to do this task for us, or we can use Q-learning to solve it!

The following code gives the starting observation state. 
```{code-cell}
import gym
env = gym.make("MountainCar-v0")
print(env.reset())
```

While the environment runs, we can also get this information
```{code-cell}
import gym

env = gym.make("MountainCar-v0")
state = env.reset()

done = False
stepsize = 0
while not done:
    action = 2
    new_state, reward, done, a, b = env.step(action)
    print(reward, new_state)
    stepsize = stepsize+1
    if stepsize > 20:
      break
```

Okay so we can see the reward is just simply -1 always so far. Then we see the observation is yet again these 2 values.

And again, to our agent, what these values are...really doesn't matter. But, for your curiosity, the values are position (along an x/horizontal axis) and velocity. So, we can see above that the car was moving left, for example, because velocity is negative.

With a general position, and a velocity, we could *definitely* come up with some sort of algorithm that could calculate whether or not we'd make it to the flag, or if we should instead reverse again to build more momentum, so we hope Q learning can do the same. These 2 values are our "observation space." This space can be of any size, but, the larger it gets, the much larger the Q Table becomes!

What's a Q Table!?

The way Q-Learning works is there's a "Q" value per action possible per state. This creates a table. In order to figure out all of the possible states, we can either query the environment (if it is kind enough to us to tell us)...or we just simply have to engage in the environment for a while to figure it out.

In our case, we can query the enviornment to find out the possible ranges for each of these state values:


```{code-cell}
print(env.observation_space.high)
print(env.observation_space.low)
```

For the value at index 0, we can see the high value is 0.6, the low is -1.2, and then for the value at index 1, the high is 0.07, and the low is -0.07. Okay, so these are the ranges, but from one of the above observation states that we output: [-0.27508804 -0.00268013], we can see that these numbers can become quite granular. Can you imagine the size of a Q Table if we were going to have a value for every combination of these ranges out to 8 decimal places? That'd be huge! And, more importantly, it'd be useless. We don't need that much granularity. So, instead, what we want to do is conver these continuous values to discrete values. Basically, we want to bucket/group the ranges into something more manageable.

We'll use 20 groups/buckets for each range. This is a variable you might decide to tweak later.

```{code-cell}
DISCRETE_OS_SIZE = [20, 20]
discrete_os_win_size = (env.observation_space.high - env.observation_space.low)/DISCRETE_OS_SIZE
print(discrete_os_win_size)
```
So this tells us how large each bucket is, basically how much to increment the range by for each bucket. We can build our q_table now with:

```{code-cell}
import numpy as np
q_table = np.random.uniform(low=-2, high=0, size=(DISCRETE_OS_SIZE + [env.action_space.n]))
print(q_table)
```

The full code is given below
```{code-cell}
import gym
import numpy as np

env = gym.make("MountainCar-v0", render_mode="rgb_array")

LEARNING_RATE = 0.1
DISCOUNT = 0.95
EPISODES = 25000
DISCRETE_OS_SIZE = [20, 20]
discrete_os_win_size = (env.observation_space.high - env.observation_space.low)/DISCRETE_OS_SIZE
q_table = np.random.uniform(low=-2, high=0, size=(DISCRETE_OS_SIZE + [env.action_space.n]))

def get_discrete_state(state):
    discrete_state = (state - env.observation_space.low)/discrete_os_win_size
    return tuple(discrete_state.astype(int))  

discrete_state = get_discrete_state(env.reset()[0])
done = False
while not done:
    action = np.argmax(q_table[discrete_state])
    new_state, reward, done, a, b = env.step(action)
    new_discrete_state = get_discrete_state(new_state)
    env.render()
    
    # If simulation did not end yet after last step - update Q table
    if not done:
        # Maximum possible Q value in next step (for new state)
        max_future_q = np.max(q_table[new_discrete_state])
        # Current Q value (for current state and performed action)
        current_q = q_table[discrete_state + (action,)]
        # And here's our equation for a new Q value for current state and action
        new_q = (1 - LEARNING_RATE) * current_q + LEARNING_RATE * (reward + DISCOUNT * max_future_q)
        # Update Q table with new Q value
        q_table[discrete_state + (action,)] = new_q

    # Simulation ended (for any reson) - if goal position is achived - update Q value with reward directly
    elif new_state[0] >= env.goal_position:
        #q_table[discrete_state + (action,)] = reward
        q_table[discrete_state + (action,)] = 0

    discrete_state = new_discrete_state
env.close()
#print the q table
print(q_table)
#print the final state
print(discrete_state)
```

It does not learn because each time we use a random q-table. The following code can learn the q-table

```{code-cell}
# objective is to get the cart to the flag.
# for now, let's just move randomly:

import gym
import numpy as np
import matplotlib.pyplot as plt

env = gym.make("MountainCar-v0")

LEARNING_RATE = 0.1

DISCOUNT = 0.95
EPISODES = 1000
SHOW_EVERY = 10

DISCRETE_OS_SIZE = [20] * len(env.observation_space.high)
discrete_os_win_size = (env.observation_space.high - env.observation_space.low)/DISCRETE_OS_SIZE

#use these to track various values through training to graph them
STATS_EVERY=10
ep_rewards = []
aggr_ep_rewards = {'ep': [], 'avg': [], 'max': [], 'min': []}

# Exploration settings
epsilon = 1  # not a constant, qoing to be decayed
START_EPSILON_DECAYING = 1
END_EPSILON_DECAYING = EPISODES//2
epsilon_decay_value = epsilon/(END_EPSILON_DECAYING - START_EPSILON_DECAYING)


q_table = np.random.uniform(low=-2, high=0, size=(DISCRETE_OS_SIZE + [env.action_space.n]))


def get_discrete_state(state):
    discrete_state = (state - env.observation_space.low)/discrete_os_win_size
    return tuple(discrete_state.astype(int))  # we use this tuple to look up the 3 Q values for the available actions in the q-table


for episode in range(EPISODES):
    discrete_state = get_discrete_state(env.reset()[0])
    done = False

    #initial reward for each episode
    episode_reward = 0

    if episode % SHOW_EVERY == 0:
        render = True
        print(episode)
    else:
        render = False

    while not done:

        if np.random.random() > epsilon:
            # Get action from Q table
            action = np.argmax(q_table[discrete_state])
        else:
            # Get random action
            action = np.random.randint(0, env.action_space.n)


        new_state, reward, done, a, b = env.step(action)

        #update reward and state
        episode_reward += reward
        new_discrete_state = get_discrete_state(new_state)

        if episode % SHOW_EVERY == 0:
            env.render()

        if not done:
            max_future_q = np.max(q_table[new_discrete_state])
            current_q = q_table[discrete_state + (action,)]
            new_q = (1 - LEARNING_RATE) * current_q + LEARNING_RATE * (reward + DISCOUNT * max_future_q)
            q_table[discrete_state + (action,)] = new_q
        elif new_state[0] >= env.goal_position:
            #q_table[discrete_state + (action,)] = reward
            q_table[discrete_state + (action,)] = 0

        discrete_state = new_discrete_state
    
    #save reward for each episode
    ep_rewards.append(episode_reward)
    if not episode % STATS_EVERY:
        average_reward = sum(ep_rewards[-STATS_EVERY:])/STATS_EVERY
        aggr_ep_rewards['ep'].append(episode)
        aggr_ep_rewards['avg'].append(average_reward)
        aggr_ep_rewards['max'].append(max(ep_rewards[-STATS_EVERY:]))
        aggr_ep_rewards['min'].append(min(ep_rewards[-STATS_EVERY:]))
        print(f'Episode: {episode:>5d}, average reward: {average_reward:>4.1f}, current epsilon: {epsilon:>1.2f}')

    #save q-table
    if episode % 10 == 0:
        np.save(f"qtables/{episode}-qtable.npy", q_table)

    # Decaying if episode number is within decaying range
    if END_EPSILON_DECAYING >= episode >= START_EPSILON_DECAYING:
        epsilon -= epsilon_decay_value

env.close()

#print out rewards
plt.plot(aggr_ep_rewards['ep'], aggr_ep_rewards['avg'], label="average rewards")
plt.plot(aggr_ep_rewards['ep'], aggr_ep_rewards['max'], label="max rewards")
plt.plot(aggr_ep_rewards['ep'], aggr_ep_rewards['min'], label="min rewards")
plt.legend(loc=4)
plt.show()
```

Print out q-tables

```{code-cell}
from mpl_toolkits.mplot3d import axes3d
import matplotlib.pyplot as plt
from matplotlib import style
import numpy as np

style.use('ggplot')

def get_q_color(value, vals):
    if value == max(vals):
        return "green", 1.0
    else:
        return "red", 0.3

fig = plt.figure(figsize=(12, 9))

for i in range(0, EPISODES, EPISODES):
    print(i)
    ax1 = fig.add_subplot(311)
    ax2 = fig.add_subplot(312)
    ax3 = fig.add_subplot(313)

    q_table = np.load(f"qtables/{i}-qtable.npy")

    for x, x_vals in enumerate(q_table):
        for y, y_vals in enumerate(x_vals):
            ax1.scatter(x, y, c=get_q_color(y_vals[0], y_vals)[0], marker="o", alpha=get_q_color(y_vals[0], y_vals)[1])
            ax2.scatter(x, y, c=get_q_color(y_vals[1], y_vals)[0], marker="o", alpha=get_q_color(y_vals[1], y_vals)[1])
            ax3.scatter(x, y, c=get_q_color(y_vals[2], y_vals)[0], marker="o", alpha=get_q_color(y_vals[2], y_vals)[1])

            ax1.set_ylabel("Action 0")
            ax2.set_ylabel("Action 1")
            ax3.set_ylabel("Action 2")

    plt.show()
```


```{code} python
import gym
import numpy as np

class QLearningAgent:
    def __init__(self, num_states, num_actions, learning_rate=0.1, discount_factor=0.9, exploration_rate=0.1):
        self.num_states = num_states
        self.num_actions = num_actions
        self.learning_rate = learning_rate
        self.discount_factor = discount_factor
        self.exploration_rate = exploration_rate
        self.q_table = np.zeros((num_states, num_actions))

    def choose_action(self, state):
        if np.random.rand() < self.exploration_rate:
            return np.random.choice(self.num_actions)  # Explore
        else:
            return np.argmax(self.q_table[state])  # Exploit

    def update_q_table(self, state, action, reward, next_state):
        best_next_action = np.argmax(self.q_table[next_state])
        td_target = reward + self.discount_factor * self.q_table[next_state, best_next_action]
        td_error = td_target - self.q_table[state, action]
        self.q_table[state, action] += self.learning_rate * td_error

def train(env, agent, num_episodes):
    for episode in range(num_episodes):
        state = env.reset()
        done = False
        total_reward = 0

        while not done:
            action = agent.choose_action(state)
            next_state, reward, done, _ = env.step(action)
            agent.update_q_table(state, action, reward, next_state)
            total_reward += reward
            state = next_state

        print("Episode:", episode + 1, "Total Reward:", total_reward)

# Example usage
if __name__ == "__main__":
    # Creating the environment
    env = gym.make('MountainCar-v0')

    # Creating the agent
    num_states = env.observation_space.n
    num_actions = env.action_space.n 
    agent = QLearningAgent(num_states, num_actions)

    # Training the agent
    train(env, agent, num_episodes=1000)
```


### Blob
Welcome to part 4 of the Reinforcement Learning series as well our our Q-learning part of it. In this part, we're going to wrap up this basic Q-Learning by making our own environment to learn in. I hadn't initially intended to do this as a tutorial, it was just something I personally wanted to do, but, after many requests, it only makes sense to do it as a tutorial!

If you've followed my tutorials much over the years, you know I like blobs. I like the player blobs, food, and bad enemy blobs! It's kind of a staple in my examples. It's only fitting that blobs show up here.

The plan is to have a player blob (blue), which aims to navigate its way as quickly as possible to the food blob (green), while avoiding the enemy blob (red).

Now, we could make this super smooth with high definition, but we already know we're going to be breaking it down into observation spaces. Instead, let's just start in a discrete space. Something between a 10x10 and 20x20 should suffice. Do note, the larger you go, the larger your Q-Table will be in terms of space it takes up in memory as well as time it takes for the model to actually learn.

```{code-cell}
import numpy as np
from PIL import Image
import cv2
import matplotlib.pyplot as plt
import pickle
from matplotlib import style
import time

style.use("ggplot")

SIZE = 10

HM_EPISODES = 25000
MOVE_PENALTY = 1
ENEMY_PENALTY = 300
FOOD_REWARD = 25
epsilon = 0.9
EPS_DECAY = 0.9998  # Every episode will be epsilon*EPS_DECAY
SHOW_EVERY = 3000  # how often to play through env visually.

start_q_table = None # None or Filename

LEARNING_RATE = 0.1
DISCOUNT = 0.95

PLAYER_N = 1  # player key in dict
FOOD_N = 2  # food key in dict
ENEMY_N = 3  # enemy key in dict

# the dict!
d = {1: (255, 175, 0),
     2: (0, 255, 0),
     3: (0, 0, 255)}


class Blob:
    def __init__(self):
        self.x = np.random.randint(0, SIZE)
        self.y = np.random.randint(0, SIZE)

    def __str__(self):
        return f"{self.x}, {self.y}"

    def __sub__(self, other):
        return (self.x-other.x, self.y-other.y)

    def action(self, choice):
        '''
        Gives us 4 total movement options. (0,1,2,3)
        '''
        if choice == 0:
            self.move(x=1, y=1)
        elif choice == 1:
            self.move(x=-1, y=-1)
        elif choice == 2:
            self.move(x=-1, y=1)
        elif choice == 3:
            self.move(x=1, y=-1)

    def move(self, x=False, y=False):

        # If no value for x, move randomly
        if not x:
            self.x += np.random.randint(-1, 2)
        else:
            self.x += x

        # If no value for y, move randomly
        if not y:
            self.y += np.random.randint(-1, 2)
        else:
            self.y += y


        # If we are out of bounds, fix!
        if self.x < 0:
            self.x = 0
        elif self.x > SIZE-1:
            self.x = SIZE-1
        if self.y < 0:
            self.y = 0
        elif self.y > SIZE-1:
            self.y = SIZE-1


if start_q_table is None:
    # initialize the q-table#
    q_table = {}
    for i in range(-SIZE+1, SIZE):
        for ii in range(-SIZE+1, SIZE):
            for iii in range(-SIZE+1, SIZE):
                    for iiii in range(-SIZE+1, SIZE):
                        q_table[((i, ii), (iii, iiii))] = [np.random.uniform(-5, 0) for i in range(4)]

else:
    with open(start_q_table, "rb") as f:
        q_table = pickle.load(f)


# can look up from Q-table with: print(q_table[((-9, -2), (3, 9))]) for example

episode_rewards = []

for episode in range(HM_EPISODES):
    player = Blob()
    food = Blob()
    enemy = Blob()
    if episode % SHOW_EVERY == 0:
        print(f"on #{episode}, epsilon is {epsilon}")
        print(f"{SHOW_EVERY} ep mean: {np.mean(episode_rewards[-SHOW_EVERY:])}")
        show = True
    else:
        show = False

    episode_reward = 0
    for i in range(200):
        obs = (player-food, player-enemy)
        #print(obs)
        if np.random.random() > epsilon:
            # GET THE ACTION
            action = np.argmax(q_table[obs])
        else:
            action = np.random.randint(0, 4)
        # Take the action!
        player.action(action)

        #### MAYBE ###
        #enemy.move()
        #food.move()
        ##############

        if player.x == enemy.x and player.y == enemy.y:
            reward = -ENEMY_PENALTY
        elif player.x == food.x and player.y == food.y:
            reward = FOOD_REWARD
        else:
            reward = -MOVE_PENALTY
        ## NOW WE KNOW THE REWARD, LET'S CALC YO
        # first we need to obs immediately after the move.
        new_obs = (player-food, player-enemy)
        max_future_q = np.max(q_table[new_obs])
        current_q = q_table[obs][action]

        if reward == FOOD_REWARD:
            new_q = FOOD_REWARD
        else:
            new_q = (1 - LEARNING_RATE) * current_q + LEARNING_RATE * (reward + DISCOUNT * max_future_q)
        q_table[obs][action] = new_q

        if show:
            env = np.zeros((SIZE, SIZE, 3), dtype=np.uint8)  # starts an rbg of our size
            env[food.x][food.y] = d[FOOD_N]  # sets the food location tile to green color
            env[player.x][player.y] = d[PLAYER_N]  # sets the player tile to blue
            env[enemy.x][enemy.y] = d[ENEMY_N]  # sets the enemy location to red
            img = Image.fromarray(env, 'RGB')  # reading to rgb. Apparently. Even tho color definitions are bgr. ???
            img = img.resize((300, 300))  # resizing so we can see our agent in all its glory.
            cv2.imshow("image", np.array(img))  # show it!
            if reward == FOOD_REWARD or reward == -ENEMY_PENALTY:  # crummy code to hang at the end if we reach abrupt end for good reasons or not.
                if cv2.waitKey(500) & 0xFF == ord('q'):
                    break
            else:
                if cv2.waitKey(1) & 0xFF == ord('q'):
                    break

        episode_reward += reward
        if reward == FOOD_REWARD or reward == -ENEMY_PENALTY:
            break

    #print(episode_reward)
    episode_rewards.append(episode_reward)
    epsilon *= EPS_DECAY

moving_avg = np.convolve(episode_rewards, np.ones((SHOW_EVERY,))/SHOW_EVERY, mode='valid')

plt.plot([i for i in range(len(moving_avg))], moving_avg)
plt.ylabel(f"Reward {SHOW_EVERY}ma")
plt.xlabel("episode #")
plt.show()

with open(f"qtable-{int(time.time())}.pickle", "wb") as f:
    pickle.dump(q_table, f)
```



### Taxi Driver

```{code-cell}
SEED = 42

import time
import random
import pickle
import numpy as np
import pandas as pd
import gymnasium as gym

from tqdm.notebook import tqdm

import matplotlib.pyplot as plt
import seaborn as sns

from scipy.stats import geom
from scipy.stats import nbinom

is_ipython = "inline" in plt.get_backend()
plt.ion()

from IPython.display import display, Markdown, clear_output

random.seed(SEED)
np.random.seed(SEED)
```

```{code-cell}
env = gym.make("Taxi-v3", render_mode="rgb_array")

print(f"OBSERVATON SPACE: {env.observation_space}")
print(f"ACTION SPACE: {env.action_space}")
```

```{code-cell}
obs, info = env.reset(seed=SEED)

print(obs)
print(info)

env.s = env.unwrapped.initial_state_distrib[6]
env.lastaction = None
env.taxi_orientation = 0

plt.imshow(env.render());
```

```{code-cell}
#Since every state is in this matrix, we can see the default reward values assigned to our illustration's state:
env.P[328]
```

```{code-cell}

```

```{code-cell}

```