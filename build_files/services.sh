#!/bin/bash

systemctl enable podman.socket
systemctl enable greetd.service
systemctl set-default graphical.target
