# The csvserver assignment
## Prerequisites
  - Install Docker and docker-compose on your machine and run following commands,
    ```sh
    docker pull infracloudio/csvserver:latest
    docker pull prom/prometheus:v2.22.0
    ```
## Part I
  1. Run the container image `infracloudio/csvserver:latest` in background and check if it's running.
  2. If it's failing then try to find the reason, once you find the reason, move to the next step.
  3. Write a bash script `gencsv.sh` to generate a file named `inputFile` whose content looks like:
     ```csv
     0, 234
     1, 98
     2, 34
     ```
     These are comma separated values with index and a random number.
     - Running the script without any arguments, should generate the file `inputFile` with 10 such entries in current directory.
     - *You should be able to extend this script to generate any number of entries, for example 100000 entries.*
     - Run the script to generate the `inputFile`. Make sure that the generated file is readable by other users.
  4. Run the container again in the background with file generated in (3) available inside the container (remember the reason you found in (2)).
  5. Get shell access to the container and find the port on which the application is listening. Once done, stop / delete the running container.
  6. Same as (4), run the container and make sure,
     - The application is accessible on the host at http://localhost:9393
     - Set the environment variable `CSVSERVER_BORDER` to have value `Orange`.

The application should be accessible at http://localhost:9393, it should have the 10 entries from `inputFile` and the welcome note should have an orange color border.

### Save the solution
  - Create a file called `README.md` in the `solution` directory with all the commands you executed as part of this section (Part I).
  - Write the `docker run` command you executed for (6) in a file named `part-1-cmd`.
  - Run one of the following commands which will generate a file with name `part-1-output`.
	```console
	curl -o ./part-1-output http://localhost:9393/raw
	# if the above command fails use,
	wget -O ./part-1-output http://localhost:9393/raw
	```
  - Run the following command which will generate a file with name `part-1-logs`.
	```console
	docker logs [container_id] >& part-1-logs
	```
  - Make sure that the files `gencsv.sh`, `inputFile`, `part-1-cmd`, `part-1-output`, `part-1-logs` are present in the `solution` directory.
  - Commit and push the changes to your repository on GitHub.

## Part II
  0. Delete any containers running from the last part.
  1. Create a `docker-compose.yaml` file for the setup from part I.
  2. One should be able to run the application with `docker-compose up`.

### Save the solution
  - Copy the `docker-compose.yaml` to the `solution` directory.
  - Commit and push the changes to your repository on GitHub.

## Part III
  0. Delete any containers running from the last part.
  1. Add Prometheus container (`prom/prometheus:v2.22.0`) to the docker-compose.yaml form part II.
  2. Configure Prometheus to collect data from our application at `<application>:<port>/metrics` endpoint. (Where the `<port>` is the port from I.5)
  3. Make sure that Prometheus is accessible at http://localhost:9090 on the host.
  4. Type `csvserver_records` in the query box of Prometheus. Click on Execute and then switch to the Graph tab.

The Prometheus instance should be accessible at http://localhost:9090, and it should show a straight line graph with value 10 (consider shrinking the time range to 5m).

### Save the solution
  - Update the `docker-compose.yaml` from the `solution` directory.
  - Add any other files you may have created to the `solution` directory.
  - Commit and push the changes to your repository on GitHub.

---
<a name="ftn1">1</a>: This scenario is inspired by the *[Tying This Together: Reverse Engineering a Production Service](https://sre.google/sre-book/accelerating-sre-on-call/#tying-this-together-reverse-engineering-a-production-service-ZKsDiLce)* section of chapter 28 from the Site Reliability Engineering book by Google.
