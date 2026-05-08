"""
Test for basalcelldemo_tools.random.random_state
"""

import os
import random

import numpy as np
import pytest

from basalcelldemo_tools.random import random_state

SEEDS = [42, 1234, 46, 0, 8, 999]


@pytest.mark.parametrize("seed", SEEDS)
def test_seed_for_random(seed):
    random.seed(seed)
    val1 = random.randrange(0, 2**31 - 1)
    random_state(seed)
    val2 = random.randrange(0, 2**31 - 1)
    assert val1 == val2, f"Seed {seed} is not set correctly for random.seed"


@pytest.mark.parametrize("seed", SEEDS)
def test_seed_for_pythonhashseed(seed):
    random_state(seed)
    assert os.environ["PYTHONHASHSEED"] == str(
        seed
    ), f"Seed {seed} is not set correctly for PYTHONHASHSEED"


@pytest.mark.parametrize("seed", SEEDS)
def test_seed_for_numpy(seed):
    np.random.seed(seed)
    val1 = np.random.randint(0, 2**31 - 1)
    random_state(seed)
    val2 = np.random.randint(0, 2**31 - 1)
    assert val1 == val2, f"Seed {seed} is not set correctly for numpy.random.seed"
