
#use the base image
FROM python:3.9.7

#set the working directory
WORKDIR /usr/src/application

#Compy the requiremest directory file into the working directory
COPY requirements.txt .

#run pip install to install dependencies
RUN pip install --no-cache-dir -r requirements.txt

#copy all all files from the current directory into the working directory
COPY . .

#run the command to start the app
CMD [ "fastapi","dev" ,"app/main.py", "--reload","--host","0.0.0.0", "--port", "8000" ]
