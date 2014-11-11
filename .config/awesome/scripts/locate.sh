#!/bin/bash
echo "Enter your search query then press enter"

read search
echo "-----------------------------------------"
echo "------Results For $search----------------"
echo "-----------------------------------------"
locate $search
echo "-----------------------------------------"
echo "----------Press enter to exit------------"
echo "-----------------------------------------"
read

