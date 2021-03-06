#!/usr/bin/env python3

from itertools import combinations
import random
import subprocess

import pytest
from typer.testing import CliRunner

from radlibsme.radlibsme import app, __version__
from radlibs import _generate_word_options, pos_tagger, make_radlibs

RANDOM_SEED = 460908


def test_version():
    """Test the CLI runs correctly."""
    result = CliRunner().invoke(app, ["--version"])
    assert result.exit_code == 0
    assert result.output.strip() == __version__


def test_help():
    """Test the CLI with --help flag."""
    result = CliRunner().invoke(app, ["--help"])
    assert result.exit_code == 0
    assert "Take a given phrase and replace key words with funny words." in result.output


def test_version():
    """Test the CLI with --version flag."""
    result = CliRunner().invoke(app, ["--version"])
    assert result.exit_code == 0
    assert result.output.strip() == __version__


test_cases = [
    ("I am a {noun}"),
    ("You {verb} {adverb}! {Interjection}!"),
    ("The {noun1} {verb}s and then the {noun1} {verb}s"),
    ("The {adjective1} {noun1} {verb}s and then the {adjective1} {noun1} {verb}s")
]


@pytest.mark.parametrize("testcase", test_cases)
def test_radlibs_cli(testcase):
    """Test a few phrase options
    """
    result = make_radlibs(testcase)
    assert isinstance(result, str)
    assert len(result.split()) == len(testcase.split())
    assert '{noun1}' not in result
    assert '{verb}' not in result
    assert '{adjective1}' not in result


def test_error_no_input():
    result = CliRunner().invoke(app, [])
    assert result.exit_code == 2
    assert "Error: Missing argument 'PHRASE'." in result.output
