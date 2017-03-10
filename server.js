const Hapi = require('hapi');
const mysql = require('promise-mysql')
var connection ;
const HapiAuth = require('hapi-auth-jwt2');
const JWT = require('jsonwebtoken');
var sha1 = require("sha1");


mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'senior_project'
}).then(function(conn){
    connection = conn;
});
const server = new Hapi.Server();
server.connection({
    host: 'localhost',
    port: 8000 ,
    routes: {
            cors: true
        }
});

server.register(HapiAuth, err => {
  if (err) {
    return reply(err);
  }
  server.auth.strategy('jwt', 'jwt', {
    key: 'mysecretKey',
    validateFunc: validate
  });
  server.auth.default('jwt');
});

function validate(decoded, request, callback) {
    var username = ""
    console.log(decoded.user_id)
  connection.query("select username from tbl_user where user_id = ?" , [decoded.user_id] ).then(function(rows){
    console.log(rows);
    username = rows[0].username;
    console.log(username)
    console.log(decoded.user_name)
    if (decoded.user_name === username) {
      return callback(null, true);
    }else {
      return callback(null, false);
    }
  }).catch(function(err){
    return callback(null, false);
  })

}


server.route({
  method: 'GET' ,
  path : '/',
  handler : function(request , reply){

     reply('Hello world')
  }
})
server.route({
  method: 'GET' ,
  path : '/api/activities/province/{pv}',
  config: {
   auth: false
  },
  handler : function(request, reply){
      var pv = encodeURIComponent(request.params.pv)
      connection.query('select * from tbl_activity where province = ?' , [pv])
      .then(function(rows){
          reply(rows)
      }).catch(function(err){
          reply(err)
      })
  }
})


server.route({
  method : "POST" ,
  path: "/api/user/register" ,
  config: {
   auth: false
  },
  handler : function(req , res){
      console.log("Hello");
      var username = req.payload.username;
      var password = sha1(req.payload.password);
      var name = req.payload.name;
      var surname = req.payload.surname;
      console.log(username);
      var createUser = connection.query("insert into tbl_user(username , password , first_name , last_name) values(?,?,?,?)" , [username ,password , name , surname]).then(function(rows){

          let user = {
            user_id : rows.insertId ,
            user_name : username
          }
            console.log(user);
            let token = JWT.sign(user, 'mysecretKey', {
            expiresIn: '7d'
            });
            console.log(token);
            res({
              token: token ,
              username : username
            });
      }).catch(function(err){
        console.log(err)
        res(err)
      })
  }
})


server.route({
  method : "POST" ,
  path: "/api/user/login" ,
  config: {
   auth: false
  },
  handler : function(req , res){
      console.log("Hello");
      var username = req.payload.username;
      var password = sha1(req.payload.password);
      console.log(username);
      var checkUserIsExist = connection.query("select * from tbl_user where username = ? and password = ?" , [username ,password]).then(function(rows){
          if(rows.length == 0){
            res("not found")
          }else{
            let user = {
              user_id : rows[0].user_id ,
              user_name : rows[0].username
            }

            let token = JWT.sign(user, 'mysecretKey', {
            expiresIn: '7d'
            });
            res({
              token: token ,
              username : rows[0].username
            });
          }
      }).catch(function(err){
        console.log(err)
        res(err)
      })
  }
})


server.route({
  method: 'POST',
  path: '/me',
  handler: (request, reply) => {
    console.log(request.payload.name)
    reply(request.auth.credentials);
  }
});


server.route({
  method: 'GET' ,
  path: '/api/activities/detail/{name}' ,
  config: {
   auth: false
  },
  handler: function(req , res){
        var id = req.params.name
        console.log(id)
        connection.query("select * from tbl_activity  where activity_name = ?  "
        , [id]
      ).then(function(results){
        res(results)
      }).catch(function(err){
          res(err)
      })
  }
})




server.route({
  method: 'GET' ,
  path: '/api/tickets/details/{id}' ,
  config: {
   auth: false
  },
  handler: function(req , res){
        var id = req.params.id
        console.log(id)
        connection.query("select * from tbl_tickets where activity_id = ?  "
        , [id]
      ).then(function(results){
        res(results)
      }).catch(function(err){
          res(err)
      })
  }
})

server.route({
  method: 'GET' ,
  path: '/api/itinerary/details/{id}' ,
  config: {
   auth: false
  },
  handler: function(req , res){
        var id = req.params.id
        console.log(id)
        connection.query("select * from tbl_itinerary where activity_id = ?  "
        , [id]
      ).then(function(results){
        res(results)
      }).catch(function(err){
          res(err)
      })
  }
})


server.route({
  method: 'GET' ,
  path: '/api/cover/{a}' ,
  config: {
   auth: false
  },
  handler: function(req , res){
        var activity_name = req.params.a;
        console.log(activity_name)
        connection.query("select cover_photo from tbl_activity where activity_name = ?" , [activity_name]
      ).then(function(results){
        console.log(results)
        res(results)
      }).catch(function(err){
          res(err)
      })
  }
})

server.route({
  method: 'GET' ,
  path: '/api/activities/popular' ,
  config: {
   auth: false
  },
  handler: function(req , res){
        connection.query("select * from tbl_activity limit 6"
      ).then(function(results){
        console.log(results)
        res(results)
      }).catch(function(err){
          res(err)
      })
  }
})



server.route({
  method: 'GET' ,
  path: '/api/activities/price/id/{aid}' ,
  config: {
   auth: false
  },
  handler: function(req , res){
        var id = encodeURIComponent(req.params.aid)
        connection.query("select * from tbl_price where activity_id = ?" , [id]
      ).then(function(results){
        res(results)
      }).catch(function(err){
          res(err)
      })
  }
})


server.route({
  method : 'POST' ,
  path: '/api/ticket',
  handler: function(req , res){
        var tickets = []
        var tick = req.payload.tickets
        var insertId = req.payload.aid
        for(var i = 0 ; i < tick.length ; i++){
          var x = [insertId , tick[i].name, tick[i].price]
          tickets.push(x)
        }
        console.log(tickets)
        connection.query("insert into tbl_tickets(activity_id , ticket_name , price) values ?" , [tickets]).then(function(result){
            res(result);
        }).catch(function(err){
          console.log(err);
            res(err)
        })

  }
})

server.route({
  method : 'POST' ,
  path: '/api/schedule',
  handler: function(req , res){
        var schedule = []
        var iti = req.payload.itinerary
        var insertId = req.payload.aid
        for(var i = 0 ; i < iti.length ; i++){
          var x = [insertId , iti[i].time, iti[i].desc]
          schedule.push(x)
        }
        console.log(schedule)
        connection.query("insert into tbl_itinerary(activity_id , times , itinerary_desc) values ?" , [schedule]).then(function(result){
            res(result);
        }).catch(function(err){
          console.log(err);
            res(err)
        })

  }
})


server.route({
  method: 'POST',
  path: '/api/activities',

  handler: function(req , res){
      //var payload = req.payload
        console.log("kuyyy")
        var name = req.payload.name
        var desc = req.payload.desc
        var cover = req.payload.cover
        var province = req.payload.province
        var location = req.payload.location
        var type = req.payload.type
        var status = "opened"
        var owner = req.payload.owner
        //console.log(priceArr)
        connection.query("insert into tbl_activity(activity_name , activity_desc ,province , location,type , status , owner) values(?,? , ? , ? , ? , ? , ?)",
         [name , desc  ,province , location , type , status , owner] ).then(function(result){
           res(result);
        //  console.log(result.insertId)
        /*var priceArr = [];
        for(var i = 0 ; i < price.length ; i++){
          x = [result.insertId ,price[i].price , price[i].amount]
          priceArr.push(x)
        }*/
      }).catch(function(err){
          res(err)
        })
  }
})


server.route({
  method: 'POST',
  path: '/api/activities/cover',
  handler: function(req , res){
      //var payload = req.payload
      console.log("kuyyy")
        var aid = req.payload.id
        var url = req.payload.url
        //console.log(priceArr)
        connection.query("update tbl_activity set cover_photo = ? where activity_id = ?",
         [url , aid] ).then(function(result){
           console.log(result)
           res(result);
      }).catch(function(err){
          res(err)
        })
  }
})




server.start((err) => {
  if(err){
    throw(err)
  }
  console.log("Running API SERVER on port 8000")
});
