# PostgreSQL Tutorial

These are SQL samples tested on PostgreSQL 12. They are derived from 
[PostgreSQL Tutorial](http://www.postgresqltutorial.com)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing 
purposes. 

### Prerequisites

Ensure that you have the following installed on your local machine:
* [Docker](https://docs.docker.com/get-docker)
* [Docker Compose](https://docs.docker.com/compose/install) 
* PosgreSQL Client (psql)

The instructions below assume you are running them on *nix.

### Running
Get the database up and running with `docker-compose -f docker-compose.yml up`

To load the sample database into the engine, run the bash script `DVD_Rental_Dataset/restore.sh`

http://localhost:8080/


To build the image: `docker build . -t postgretutorial:v1`

To start the container: `docker run -it --name postgretut_container postgretutorial:v1 /bin/bash`

docker run -it --name some-postgretut_container -e POSTGRES_PASSWORD=secret -d postgres
docker run -it --name some-postgretut_container -e POSTGRES_PASSWORD=secret postgretutorial:v1 /bin/bash

To remove the image: 
* first remove the container that is using it: `docker rm postgretut_container`
* then remove the image: `docker rmi postgretutorial:v1`

A step by step series of examples that tell you how to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo


## About the Sample Database
You can view the DVD Rental ER Model [here](http://www.postgresqltutorial.com/postgresql-sample-database)


### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **[Michael Wakahe](http://www.michaelwakahe.com)** - *Initial image setup*


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details


## Acknowledgments

* Hat tip to anyone whose code was used
