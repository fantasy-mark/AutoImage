#!/bin/bash

gunicorn main:app --bind 0.0.0.0:8000 --workers 4