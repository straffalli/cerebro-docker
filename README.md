# cerebro-docker
A minimal docker image of Cerebro - Elasticsearch Web Admin Tool

# Description

Docker image of Cerebro. Cerebro is an open source(MIT License) elasticsearch web admin tool built using Scala, Play Framework, AngularJS and Bootstrap developed by Leonardo Menezes.

For a full description please refer to [https://github.com/lmenezes/cerebro](https://github.com/lmenezes/cerebro)

# Usage

**Run Cerebro with default settings**
Run cerebro with default settings, will listen on address `0.0.0.0` port `9000`

```
docker run -d cerebro:0.7.1
```
**Start Cerebro with different arguments**
All paramters documented at [https://github.com/lmenezes/cerebro](https://github.com/lmenezes/cerebro) supported.
Example:
```
docker run -d -p 5678 cerebro:0.7.1 -Dhttp.port=5678
```


**Apply configuration file**
It is also possible to provide your own configuration files
```
docker run -d -v /your/application.conf:/usr/share/cerebro/conf/application.conf cerebro:0.7.1
```


