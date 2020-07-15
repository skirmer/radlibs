from itertools import combinations
import random
import subprocess

import pytest
from typer.testing import CliRunner

from radlibsme.radlibs import app, __version__
from radlibs import _generate_word_options, pos_tagger, make_radlibs

RANDOM_SEED = 460908


def test_help():
    """Test the CLI with --help flag."""
    result = CliRunner().invoke(app, ["--help"])
    assert result.exit_code == 0
    assert "Generate an ASCII picture of Spongebob" in result.output


def test_version():
    """Test the CLI with --version flag."""
    result = CliRunner().invoke(app, ["--version"])
    assert result.exit_code == 0
    assert result.output.strip() == __version__


test_cases = [
    ("I am a {noun}"),
    ("You {verb} {adverb}! {Interjection}!"),
    ("The {noun1} {verb}s and then the {noun1} {verb}s")
]


@pytest.mark.parametrize("testcase", test_cases)
def test_command(testcase):
    """Test the CLI with each styling flag.
    """

    result = CliRunner().invoke(
        app, [testcase])
    assert result.exit_code == 0

    expected = expected_func(testcase) + "\n"

    assert result.output == expected


@pytest.mark.parametrize("testcase", test_cases)
def test_command_python_m(testcase):
    """Test the CLI using python -m invocation with each styling flag.
    """
    result = subprocess.run(
        ["python", "-m", "radlibs"] + [testcase]],
        stdout = subprocess.PIPE,
        stderr = subprocess.PIPE,
        universal_newlines = True,
    )
    assert result.returncode == 0

    random.seed(RANDOM_SEED)
    expected=expected_func(testcase)

    assert result.stdout == expected + "\n"


def test_error_no_input():
    result=CliRunner().invoke(app, [])
    assert result.exit_code == 2
    assert "Error: Missing argument 'phrase'." in result.output
