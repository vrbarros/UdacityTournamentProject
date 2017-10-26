# Udacity Tournament Project

## Description

I made this program made as part of Udacity Fullstack Development Nanodegree course. The objective is to store game matches and pair players, in a swiss-stlye pairing.

## Requirements

- Python
- Vagrant
- VirtualBox

## Instructions

1) In Vagrant folder, start vagrant using command`vagrant up`
2) You have to connect to vagrant using command `vagrant ssh`
3) Run psql using command `psql`
4) Create the database tournament `CREATE DATABASE tournament;`
5) Now, connect to the database using command `\c tournament`
6) Create all tables using script and command `\i tournament.sql`
7) Exit psql using command `\q`
8) Go to tournament directory using command `cd /vagrant/tournament/`
9) Run tests to validate the project `python tournament_test.py`
