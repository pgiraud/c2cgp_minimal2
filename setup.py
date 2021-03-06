# -*- coding: utf-8 -*-

try:
    from setuptools import setup, find_packages
except ImportError:
    from ez_setup import use_setuptools
    use_setuptools()
    from setuptools import setup, find_packages

setup(
    name='c2cgp_minimal2',
    version='1.0',
    description='c2cgp_minimal2, a c2cgeoportal project',
    author='camptocamp',
    author_email='info@camptocamp.com',
    url='http://www.camptocamp.com/geospatial-solutions',
    install_requires=[
        'c2cgeoportal>=1.6.0.dev',
    ],
    packages=find_packages(exclude=['ez_setup']),
    include_package_data=True,
    zip_safe=False,
    entry_points={
        'paste.app_factory': [
            'main = c2cgp_minimal2:main',
        ],
        'console_scripts': [
            'create_db = c2cgp_minimal2.scripts.create_db:main',
        ],
    },
)
