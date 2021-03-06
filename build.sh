#!/bin/bash

cd "${0%/*}"

dt=`date '+%Y%m%d%H%M%S'`


cd streamlit-base

docker build --build-arg PYTHON_VERSION=3.8.5 -t ideonate/streamlit-base:$dt .
docker tag ideonate/streamlit-base:$dt ideonate/streamlit-base:latest


cd ../streamlit-single

docker build -t ideonate/streamlit-single:$dt .
docker tag ideonate/streamlit-single:$dt ideonate/streamlit-single:latest


cd ../streamlit-base-scipy

docker build -t ideonate/streamlit-base-scipy:$dt .
docker tag ideonate/streamlit-base-scipy:$dt ideonate/streamlit-base-scipy:latest


cd ../streamlit-single

docker build --build-arg BASE_REPO=ideonate/streamlit-base-scipy:$dt -t ideonate/streamlit-single-scipy:$dt .
docker tag ideonate/streamlit-single-scipy:$dt ideonate/streamlit-single-scipy:latest


cd ../streamlit-launchpad

docker build -t ideonate/streamlit-launchpad:$dt .
docker tag ideonate/streamlit-launchpad:$dt ideonate/streamlit-launchpad:latest


cd ../streamlit-launchpad

docker build --build-arg BASE_REPO=ideonate/streamlit-base-scipy:$dt -t ideonate/streamlit-launchpad-scipy:$dt .
docker tag ideonate/streamlit-launchpad-scipy:$dt ideonate/streamlit-launchpad-scipy:latest