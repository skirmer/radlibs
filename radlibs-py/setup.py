#!/usr/bin/env python
# -*- coding: utf-8 -*-

from setuptools import setup

setup(name='radlibs',
      version='0.2.0',
      description='Build Your Own Madlibs!',
      author='Stephanie Kirmer',
      author_email='stephanie@stephaniekirmer.com',
      packages=['radlibs'],
      url="https://github.com/skirmer/radlibs/tree/master/radlibs-py",
      install_requires=['pandas',
                        'feather-format'],
      package_data={'radlibs': ['data/*.feather']},
      include_package_data=True,
      classifiers=[
          "Programming Language :: Python :: 3",
          "License :: OSI Approved :: BSD License",
          "Operating System :: OS Independent",
      ])
