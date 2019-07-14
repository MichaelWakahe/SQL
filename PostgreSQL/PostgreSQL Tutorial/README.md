# Project Title

These are SQL samples tested on PostgreSQL 11.4. They are derived from [PostgreSQL Tutorial](http://www.postgresqltutorial.com)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Ensure that you have the following installed on your local machine:
* [Docker](https://www.docker.com)
* [Ansible](https://www.ansible.com) preferably > v2.5


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

## Docker Image Creation

The custom docker image used in this project is based off of the [Postgres Docker image](https://hub.docker.com/_/postgres)

Setting up the container:

	docker pull postgres:11.4
	docker network create --subnet=172.18.0.0/16 mynet123
	docker run --name postgres_container -e POSTGRES_PASSWORD=mypass -d --net mynet123 --ip 172.18.0.2 postgres:11.4

Note that the docker (Linux) bridge network is not reachable from a mac OS host - see [documentation](https://docs.docker.com/docker-for-mac/networking).


Get to the console of the container:

	docker exec -it postgres_container /bin/bash

Starting up the container, in case you had previously stopped or paused it:

	docker start postgres_container

After you attach yourself to the container's terminal for the 1st time:

	apt-get update
	apt-get install vim openssh-client openssh-server python sudo -y
	(optional) apt-get install iputils-ping net-tools -y
	/etc/init.d/ssh start

Create another user apart from root to allow for SSH login (the machine doesn't allow root to ssh in); set the new user password to 'foobar' (or whatever is in the	playbook file 'site.yml')

    adduser michael
	usermod -aG sudo michael


Copy the host machine public key 'id_rsa.pub' to the ssh file '~/.ssh/authorized_keys' in the container.

You can then log in passwordlessly from the host using the IP address above. Port 5432 for Postgres is also available using this IP.

Modify your host Ansible settings as follows: add these lines to /etc/ansible/ansible.cfg:

    allow_world_readable_tmpfiles = True
    pipelining = True

Run the Ansible playbook against the Docker container:

    cd ansible
    ansible-playbook --inventory hosts site.yml

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


Saving the container into an image:

     docker commit postgres_container mwakahe/postgres-tutorial

Pushing it to Docker Hub:

    docker login
    docker push mwakahe/postgres-tutorial


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
