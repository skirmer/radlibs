import pytest
from radlibs import _generate_word_options, pos_tagger, make_radlibs


test_cases = [
    ("I am a {noun}"),
    ("You {verb} {adverb}! {Interjection}!"),
    ("The {noun1} {verb}s and then the {noun1} {verb}s")
]


@pytest.mark.parametrize("testcase", test_cases)
def test_funct(testcase):
    """Test a few phrase options
    """

    result = radlibs.make_radlibs(testcase)

    assert isinstance(result, str)
    assert len(result) > len(test_string)
