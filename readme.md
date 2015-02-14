# this is flashbang!

```
.. O
.. /I_
.. / 
[][][][][] ... >-/-O....... [][][][]
[][][][][] ................ [][][][]
[][][][][] ................ [][][][]
```

## flashbang is an Instagram-style person-to-person marketplace

### key features of flashbang are

* a private network (UT Austin)
* tagging & following tags
* simply coordinating the transfer of goods
* extremely fast item posting
* knowledge of top tags being followed so users can post those items


### Development Configuration

**MailCatcher**

1. `gem install mailcatcher` once to install on your system
2. before running project in development, run `mailcatcher` in your terminal window to launch the development mail server
3. Check `http://localhost:1080/` for mail sent by the app

**Sidekiq & Redis**

1. Before installing Sidekiq, be sure to install Redis. `brew install redis`
2. Sidekiq needs to be on for Sidekiq to work. In it's own window, launch `redis-server`
3. Launch Sidekiq in its own terminal window with `bundle exec sidekiq`

