# -*- coding: utf-8 -*-
'''
Module for running arbitrary tests
'''

# Import Python libs
import os
import sys
import time
import random

# Import Salt libs
import salt
import salt.version
import salt.loader


def echo(text):
    '''
    Return a string - used for testing the connection

    CLI Example:

    .. code-block:: bash

        salt '*' test.echo 'foo bar baz quo qux'
    '''
    return text


def ping():
    '''
    Just used to make sure the minion is up and responding
    Return True

    CLI Example:

    .. code-block:: bash

        salt '*' test.ping
    '''
    return True