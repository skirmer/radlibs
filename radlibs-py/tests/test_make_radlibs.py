import pytest
from radlibs import _generate_word_options, pos_tagger, make_radlibs


test_cases = [
    ("I am a {noun}"),
    ("You {verb} {adverb}! {Interjection}!"),
    ("The {noun1} {verb}s and then the {noun1} {verb}s"),
    ("The {adjective1} {noun1} {verb}s and then the {adjective1} {noun1} {verb}s")
]


@pytest.mark.parametrize("testcase", test_cases)
def test_make_radlibs(testcase):
    """Test a few phrase options
    """
    result = make_radlibs(testcase)
    assert isinstance(result, str)
    assert len(result.split()) == len(testcase.split())
    assert '{noun1}' not in result
    assert '{verb}' not in result
    assert '{adjective1}' not in result
