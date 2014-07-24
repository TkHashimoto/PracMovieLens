#!/usr/bin/env python
#-*- coding: utf-8 -*-

import unittest
import csv
import sys
import numpy as np
from scipy import stats


def main():
	dat = [row for row in csv.reader(file("ratings.csv"))]
	dat = [[float(v) for v in row] for row in dat[1:]]
	sys.stderr.write("Load complete. file=ratigs.csv\n")

	

if __name__=="__main__":
	main()
