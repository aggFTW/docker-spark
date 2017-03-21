#!/bin/bash
bin/run-example SparkPi 10 &> testresultscala.log

if grep -q roughly testresultscala.log; then
    echo "Success SparkPi"
else
    echo "Error SparkPi"
    exit 1
fi

bin/spark-submit examples/src/main/python/pi.py &> testresultpython.log

if grep -q roughly testresultpython.log; then
    echo "Success Pi.py"
else
    echo "Error Pi.py"
    exit 1
fi
