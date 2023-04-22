var express = require('express');
var router = express.Router();
var db=require('../database_connection');

var nodemailer = require('nodemailer');


var cors = require('cors');
var app = express();
 
app.use(cors());
//app.use(cors({origin: '*'}));



router.get('/payments', function(req, res, next) { 
res.render('users'); 
});


router.get('/load_payments', function(req, res, next) {

 var sql = 'select * from donation order by id desc';
  db.query(sql,function (err, result) { 
      if (err) throw err;
         console.log("Payments Donation successfully Loaded"); 
 console.log(result);
//res.render('users', { data: result })
//res.render({ data: result })


res.json({data: result});



  });
}); 





router.get('/load_post', function(req, res, next) {

 var sql = 'select * from posts order by id desc';
  db.query(sql,function (err, result) { 
      if (err) throw err;
         console.log("Post Loaded successfully "); 
 console.log(result);
//res.render('users', { data: result });

res.json({data: result});



  });
}); 




router.post('/send_data', function(req, res, next) {
var today = new Date();
var fullname = req.body.fullname;
var email = req.body.email;
var location = req.body.location;
var title = req.body.title;
var description = req.body.desc;
var amounting = req.body.amount;
var video_id = req.body.video_id;
var crypto_accountId =req.body.crypto_accountId;
var timing = Math.floor(new Date().getTime() / 1000);

/*
create table posts(id int primary key auto_increment,fullname varchar(100),email varchar(100),location varchar(100),title varchar(200),description text,
amounting varchar(100),video_id varchar(100),timing varchar(100), crypto_accountId  varchar(100));
*/
 
  // insert user data into  table
  var sql = 'INSERT INTO posts(fullname, email, location, title, description,amounting,video_id,timing,crypto_accountId) values (?,?,?,?,?,?,?,?,?)';
  db.query(sql, [fullname,email,location,title,description,amounting,video_id,timing,crypto_accountId],function (err, results, fields) { 
      if (err) throw err;
         console.log("Posts Inserted successfully ");
console.log("Inserted Posts: "+  results); 
console.log("Row inserted with id = "+  results.insertId); 
console.log("Number of rows affected : " + results.affectedRows);

if(results.affectedRows == 1){

res.json({
message:'Content Posted successfully',
code:'success'
 });

}else{

res.json({
message:'Content Posted Failed',
code:'failed'
 });

}

  });
 //res.redirect('/users/form'); 

}); 




// make donation payment via Hedera

router.post('/send_donation', function(req, res, next) {
var today = new Date();
var reciever_id = req.body.reciever_id;
var reciever_name = req.body.reciever_name;
var donor_name = req.body.donor_name;
var donor_account_id = req.body.donor_account_id;
var donor_amount = req.body.donor_amount;
var donor_private_key = req.body.donor_private_key;
var timing = Math.floor(new Date().getTime() / 1000);
var reciever_account= req.body.reciever_account;



  // insert user data into  table
  var sql = 'INSERT INTO donation(reciever_id,reciever_name,donor_name,donor_account_id,donor_amount,donor_private_key,timing,reciever_account) values (?,?,?,?,?,?,?,?)';
  db.query(sql, [reciever_id,reciever_name,donor_name,donor_account_id,donor_amount,donor_private_key,timing,reciever_account],function (err, results, fields) { 
      if (err) throw err;
         console.log("Donation Data Inserted successful ");
console.log("Inserted Posts: "+  results); 
console.log("Row inserted with id = "+  results.insertId); 
console.log("Number of rows affected : " + results.affectedRows);


if(results.affectedRows == 1){

//res.json({message:'Donation Data Inserted successfully',code:'success'});

}else{

res.json({message:'Donation Data Insertion Failed',code:'failed'});

}

  });
 //res.redirect('/users/payments'); 








// start Hedera payments or Transfers


const { 
 Client, 
 PrivateKey, 
 AccountCreateTransaction, 
 AccountBalanceQuery, 
 Hbar, 
 TransferTransaction
} = require("@hashgraph/sdk");
require("dotenv").config();

//Grab your Hedera testnet account ID and private key from your .env file
const myAccountId = donor_account_id;
const myPrivateKey = donor_private_key;

// If we weren't able to grab it, we should throw a new error
if (myAccountId == null || myPrivateKey == null ) {
    throw new Error("Environment variables myAccountId and myPrivateKey must be present");
}

// Create our connection to the Hedera network
// The Hedera JS SDK makes this really easy!
const client = Client.forTestnet();

client.setOperator(myAccountId, myPrivateKey);

//Create new keys
const newAccountPrivateKey = PrivateKey.generateED25519(); 
const newAccountPublicKey = newAccountPrivateKey.publicKey;

(async () => {

const recieverAccountId = reciever_account;

var amount_pay  = parseFloat(donor_amount);

//Verify the account balance
const accountBalance = await new AccountBalanceQuery()
    .setAccountId(myAccountId)
    .execute(client);

console.log("The Donor account balance  before transaction is: " +accountBalance.hbars.toTinybars() +" tinybars.");

//Create the transfer transaction

const sendHbar = await new TransferTransaction()
    .addHbarTransfer(myAccountId, Hbar.fromTinybars(-amount_pay))
    .addHbarTransfer(recieverAccountId, Hbar.fromTinybars(amount_pay))
    .execute(client);


//Verify the transaction reached consensus
const transactionReceipt = await sendHbar.getReceipt(client);
console.log("The transfer transaction from Donor to Reciever: " + transactionReceipt.status.toString());

//Request the cost of the query
const queryCost = await new AccountBalanceQuery()
 .setAccountId(myAccountId)
 .getCost(client);

console.log("The cost of query is: " +queryCost);
console.log("amount to pay: " +amount_pay);

//Check the new account's balance
const getNewBalance = await new AccountBalanceQuery()
    .setAccountId(myAccountId)
    .execute(client);

console.log("The Donor account balance after the transfer is: " +getNewBalance.hbars.toTinybars() +" tinybars.");



res.json({
            message:"Transaction Successful",
            cost: "The cost of query is: " +queryCost,
            code:'success'

        });


})();



// end hedera payments

}); 



module.exports = router;