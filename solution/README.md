1.Check if docker and docker-compose are installed

  docker -v
  docker-compose -v
  
2.Pull the specified docker images

  docker pull infracloudio/csvserver:latest
  
  docker pull prom/prometheus:v2.22.0
  
3.Clone the specified repository

  git clone https://github.com/infracloudio/csvserver.git
  
4.cd into the solution directory, and perform all the steps from that directory.

  cd csvserver/solution/
  
5.Run the container image infracloudio/csvserver:latest in background and check if it's running

  docker run -itd infracloudio/csvserver:latest
  
  The container was not running:
  
  docker ps
  
  To check the exited container:
  
  docker ps -a
  
  Further investigated:
  
  docker logs a4d30064ffa7
  
  Reason: 2022/03/13 07:49:58 error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory
  
6.Write a bash script gencsv.sh to generate a file named inputFile

  touch gencsv.sh
  
  vi gencsv.sh
  
  Run the script:
  
  bash /home/ubuntu/csvserver/solution/gencsv.sh

7. Now run the container again:

  docker run -itd -v /home/ubuntu/csvserver/solution/inputFile:/csvserver/inputdata 8cb989ef80b5
  
  Note: REPOSITORY                              TAG              IMAGE ID       CREATED         SIZE
        infracloudio/csvserver                  latest           8cb989ef80b5   12 months ago   237MB
	
8.Get shell access to the container and find the port on which the application is listening. Once done, stop / delete the running container.

  docker ps
  
  docker exec -it <container-id> bash
	
  Run the command to check the port:
	
  netstat -tulnp
	
  docker stop <container-id>
  
9. Make sure The application is accessible on the host at http://localhost:9393 and Set the environment variable CSVSERVER_BORDER to have value Orange
	
   docker run -itd -v /home/ubuntu/csvserver/solution/inputFile:/csvserver/inputdata -p 9393:9300 -e CSVSERVER_BORDER='Orange' 8cb989ef80b5
   
10. Check if the docker container is running or not.
	
	docker ps
