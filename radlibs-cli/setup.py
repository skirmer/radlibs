#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from setuptools import setup

setup(name='radlibsme',
      version='0.2.0',
      description='Build Your Own Madlibs at Command Line!',
      author='Stephanie Kirmer',
      author_email='stephanie@stephaniekirmer.com',
      keywords=["madlibs", "radlibs", "jokes", "humor", "funny"],
      packages=['radlibsme'],
      url="https://github.com/skirmer/radlibs/tree/master/radlibs-cli",
      install_requires=['pandas',
                        'feather-format',
                        'radlibs',
                        'typer'],
      package_data={'radlibs': ['data/*.feather']},
      entry_points={"console_scripts": [
          "radlibsme=radlibsme.radlibsme:app"]},
      include_package_data=True,
      python_requires=">=3.6",
      classifiers=[
          "Programming Language :: Python :: 3",
          "License :: OSI Approved :: BSD License",
          "Operating System :: OS Independent",
      ])
