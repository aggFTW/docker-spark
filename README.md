
# spark

An `ubuntu` based [Spark](http://spark.apache.org) container. Use it in a standalone cluster with the accompanying `docker-compose.yml`, or as a base for more complex recipes.

## building

To build, run:

    docker build -t {IMAGE_NAME} .

## docker example

To run in bash, run the image with:

    docker run --rm -it -p 4040:4040 {IMAGE_NAME} /bin/bash

To run `SparkPi`, run the image with Docker:

    docker run --rm -it -p 4040:4040 {IMAGE_NAME} bin/run-example SparkPi 10

To do a thing with Pyspark

    echo "import pyspark\nprint(pyspark.SparkContext().parallelize(range(0, 10)).count())" > count.py
    docker run --rm -it -p 4040:4040 -v $(pwd)/count.py:/count.py {IMAGE_NAME} bin/spark-submit /count.py

## docker-compose example

To create a simplistic standalone cluster with [docker-compose](http://docs.docker.com/compose):

    docker-compose up

The SparkUI will be running at `http://${YOUR_DOCKER_HOST}:8080` with one worker listed. To run `pyspark`, exec into a container:

    docker exec -it dockerspark_master_1 /bin/bash
    bin/pyspark

To run `SparkPi`, exec into a container:

    docker exec -it dockerspark_master_1 /bin/bash
    bin/run-example SparkPi 10

Then, to shutdown the master and worker, execute:

    docker-compose down

## license

MIT
