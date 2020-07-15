from pathlib import Path
import random
from typing import Optional

from radlibs import _generate_word_options, pos_tagger, make_radlibs
import typer


app = typer.Typer()


with (Path(__file__).parent / "VERSION").open("r") as fp:
    __version__ = fp.read().strip()


def version_callback(value: bool):
    if value:
        typer.echo(__version__)
        raise typer.Exit()


@app.command()
def main(
    phrase: str = typer.Argument(
        ...,
        help=(
            "Phrase to convert. If your input text contains spaces, you will need to wrap it with "
            "quotes."
        ),
    ),
    version: bool = typer.Option(
        False,
        "--version",
        callback=version_callback,
        is_eager=True,
        help="Show radlibs version and exit.",
        show_default=False,
    ),
):
    """Take a given phrase and replace key words with funny words.
    """
    out = make_radlibs(phrase)

    typer.echo(out)
