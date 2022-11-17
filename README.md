# Tasker

Tasker is a Task Management mobile application developed using Flutter. This project was originally created to learn how to implement Clean Architecture concepts in a real project. Also, messing with some packages as I advanced further into the logic was a plus.

## Install, build and run

To run this project locally, clone this repository and, navigate into the directory: 

```
# Clone this repository
$ git clone https://github.com/e-meyer/tasker.git

# Go into de repository
$ cd tasker
```

Then, to get the project's dependencies, run:

```
# Get dependencies
$ flutter pub get
```

After that, run the ```main.dart``` file in your IDE.

## Pub.dev Packages

- [Hive](https://pub.dev/packages/hive)
  > Store the user's data locally. Because of it's high performance (and some curiosity) I've chosen this package to store the data. Up until this moment, I've only used SharedPreferences and SQFlite to deal with local data, so I wanted to try something else.   
- [get_it](https://pub.dev/packages/get_it)
  > Writing this project and using a dependency injection package was the moment I realised how important it is to have a package for that. 
  
****