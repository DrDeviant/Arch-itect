#!/bin/bash

# intall packages from txt
yay -S --needed --sudoloop --useask - < packages.txt
