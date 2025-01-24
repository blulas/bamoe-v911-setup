# IBM Business Automation Manager Open Editions - Setup Instructions - Docker Compose
If you are currently running docker, podman, or Rancher Desktop, you can utilize the docker compose configuration scripts in this section of the repository.  You can use `Docker Compose` to run the BAMOE images locally and the easiest way is to use `Rancher Desktop`.  Click [here](https://docs.rancherdesktop.io/getting-started/installation/) in order to get instructions on how to install Rancher Desktop in Docker mode.  

## Maven Repository
For more information on how to properly setup Maven for local development, visit [Setting Up Maven](./maven/README.md).

## Container Images
As some of the container images for BAMOE v9.1.1 can be pulled directly from Quay.io.  Here are the steps to follow:

1.  In the `docker-compose` folder, use the `docker-compose.yml` file in order to load the individual services as containers:

    ```bash
    docker compose --profile=<profile> up [optional]<service-name>
    ```

    where `<profile>` equals "dev", "infra", or "full"
    where `<service-name>` equals the name of the service in compose file (optional, leaving this off will install all services in the `docker-compose.yml` file.)

2.  The images will start containers on the following ports:

     | Service                   | Port @ localhost              |
    | ------------------------- | ----------------------------- |
    | BAMOE Maven               | [9011](http://localhost:9011) |
    | BAMOE Canvas              | [9090](http://localhost:9090) |
    | PostgreSQL                | [5432](http://localhost:5432) |
    | PgAdmin                   | [8055](http://localhost:8055) |







