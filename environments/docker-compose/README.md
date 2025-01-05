# IBM Business Automation Manager Open Editions - Local Machine Setup Instructions - Docker Compose
If you are currently running docker, podman, or Rancher Desktop, you can utilize the docker compose configuration scripts in this section of the repository.  You can use `Docker Compose` to run the BAMOE images locally and the easiest way is to use `Rancher Desktop`.  Click [here](https://docs.rancherdesktop.io/getting-started/installation/) in order to get instructions on how to install Rancher Desktop in Docker mode.  

## Maven Repository
For more information on how to properly setup Maven for local development, visit [Setting Up Maven](./maven/README.md).

## Container Images
As the container images for BAMOE v9.1.1 are currently published to Quay.io.  The docker-compose.yml files contained in this folder pull the images directly from Quay.io.  

1.  In the `docker-compose` folder, run the following `docker-compose` files in order to load the individual images as containers:

    ```bash
    docker compose -f bamoe-maven.yml up
    docker compose -f bamoe-canvas.yml up
    ```

    OR (_for the full install, use either the DMOE or PAMOE file:_)

    ```bash
    docker compose -f bamoe-dmoe.yml up
    docker compose -f bamoe-pamoe.yml up
    ```

2.  The images will start containers on the following ports:

    **Decision Manager Open Edition (DMOE)**

    | Service                   | Port @ localhost              |
    | ------------------------- | ----------------------------- |
    | BAMOE Maven               | [9011](http://localhost:9011) |
    | BAMOE Canvas              | [9090](http://localhost:9090) |

    **Process Automation Manager Open Edition (PAMOE)**

    | Service                   | Port @ localhost              |
    | ------------------------- | ----------------------------- |
    | BAMOE Maven               | [9011](http://localhost:9011) |
    | BAMOE Canvas              | [9090](http://localhost:9090) |
    | PostgreSQL                | [5432](http://localhost:5432) |
    | PgAdmin                   | [8055](http://localhost:8055) |

> [NOTE]  
> During container creation time, you may encounter an error message indicating that the container was unable to read/write to local volumns.  This is usuall just a case of setting the correct file permissions, such as `pgadmin` or `sql` folders.  In order to fix this, perform the following commands in this project's `docker-compose` folder:
```bash
chmod 755 sql
chmod 755 keycloak
chmod 755 pgadmin
chmod 755 pgadmin/pgpass
```



