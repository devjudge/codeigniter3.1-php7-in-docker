FROM composer:1.9

COPY user_guide /tmp/user_guide/
COPY system /tmp/system/
COPY readme.rst /tmp/
COPY license.txt /tmp/
COPY index.php /tmp/
COPY contributing.md /tmp/
COPY composer.json /tmp/
COPY application /tmp/application/
COPY composer.lock /tmp/

WORKDIR /tmp/

EXPOSE 8000

# Build the app
RUN wget https://codejudge-starter-repo-artifacts.s3.ap-south-1.amazonaws.com/backend-project/codeigniter/build.sh
RUN chmod 775 ./build.sh
RUN sh build.sh

# Add extra docker commands here (if any)...

# Run the app
RUN wget https://codejudge-starter-repo-artifacts.s3.ap-south-1.amazonaws.com/backend-project/codeigniter/run.sh
RUN chmod 775 ./run.sh
CMD sh run.sh



