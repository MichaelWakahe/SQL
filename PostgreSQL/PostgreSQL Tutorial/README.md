# Project Title

These are SQL samples tested on PostgreSQL 11.4. They are derived from [PostgreSQL Tutorial](http://www.postgresqltutorial.com)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Ensure that you have [Docker](https://www.docker.com) installed on your local machine.


You need to load up the [sample database](http://www.postgresqltutorial.com/postgresql-sample-database) offered in
PostgreSQL Tutorial.

Example to load up the sample database in *nix:

```
psql -h HOST -d YOUR_DATABASE_NAME -U USERNAME -W < file.sql
```

For example
```
psql -h localhost -d sampledb -U baz -W < restore.sql
```

The changes to the restore.sql before it works:
* put absolute paths for all the .dat files
* change `DROP SCHEMA public` to `DROP SCHEMA public CASCADE`

### Installing

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

## Running the tests

Explain how to run the automated tests for this system

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
