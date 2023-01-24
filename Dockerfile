FROM python:3.7-alpine
LABEL author=Tarun
LABEL app=StudentCoursesRestAPI
ARG HOME_DIR='/studentcourses'
ARG branch=dev 
ADD . $HOME_DIR
ENV MYSQL_USERNAME='mysql-user'
ENV MYSQL_PASSWORD='mysql-password'
ENV MYSQL_SERVER_PORT='3306'
ENV MYSQL_DATABASE='mysql-db'
ENV MYSQL_ROOT_PASSWORD='rootrooot'
EXPOSE 8080
WORKDIR $HOME_DIR
RUN pip install -r requirements.txt
ENTRYPOINT ["python", "app.py"]