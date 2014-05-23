#!/usr/bin/env python
# -*- coding: utf-8 -*-

#-MetaData.-------------------------------------------------------------------
__doc__ = """
Test App for Portable Python six package.
=========================================

A runnable wxSanity test.

"""
__author__ = "Metallicow"
__license__ = "Python"


if __name__ == '__main__':
    import six
    dictionary = {
        0: 'zero'
        1: 'one'
        2: 'two'
        3: 'three'
        4: 'four'
        5: 'five'
        6: 'six'
        7: 'seven'
        8: 'eight'
        9: 'nine'
        }

    for key, value in six.iteritems(dictionary):
        print('%s = %s' % (key, value))
