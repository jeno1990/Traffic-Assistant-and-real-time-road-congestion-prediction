const nodemailer = require('nodemailer');
const express =require('express')
let transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
            user: "your_gmail_account@gmail.com",
            pass: "PASSWORD"
        }
});
  
let message = {
    from: "from@email.com",
    to: "receiver_email@gmail.com",
    subject: "Subject",
    html: "<h1>Hello SMTP Email</h1>"
}
  
transporter.sendMail(message, function(err, info) {
  if (err) {
    console.log(err);
  } else {
    console.log(info);
  }
})