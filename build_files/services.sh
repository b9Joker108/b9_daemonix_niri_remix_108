#!/bin/bash

systemctl enable podman.socket
systemctl enable lightdm.service
systemctl set-default graphical.target