# IBM Business Automation Manager Open Editions - Setup Instructions - OpenShift
TBD...

## Maven Repository
For more information on how to properly setup Maven for local development, visit [Setting Up Maven](./maven/README.md).

## Container Images
As some of the container images for BAMOE v9.1.2 are not currently published to Quay.io, it becomes necessary to load those images in your your local docker setup so that you can refer to them as if they were published to Quay.io.  In other cases the images can be pulled directly from Quay.io.  Here are the steps to follow:

1.  In the root folder, run the following commands only if you don't have access to Quay.io, skip this step if you do have access:

    ```bash
    docker load < ../images/bamoe-9.1.1-maven-repository-image.tar.gz
    docker load < ../images/bamoe-9.1.2-management-console-image.tar.gz
    ```

3.  TBD...

4.  The images will start containers on the following ports:

    | Service                   | Port @ localhost              |
    | ------------------------- | ----------------------------- |
    | BAMOE Maven               | [9011](http://localhost:9012) |
    | BAMOE Canvas              | [9090](http://localhost:9090) |


