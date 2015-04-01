# -*- coding: utf-8 -*-

import logging

from pyramid.i18n import TranslationStringFactory
from formalchemy import FieldSet, Grid  # noqa

from c2cgp_minimal2 import models  # noqa
from c2cgeoportal.forms import *  # noqa

_ = TranslationStringFactory("c2cgp_minimal2-server")
log = logging.getLogger(__name__)
