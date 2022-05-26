const nodemailer = require("nodemailer");
const { google } = require("googleapis");
const SendmailTransport = require("nodemailer/lib/sendmail-transport");
const { gmail } = require("googleapis/build/src/apis/gmail");

const CLIENT_ID =
  "672305526240-7k4c3uqma511loccfr9cc398opt56kpa.apps.googleusercontent.com";
const CLIENT_SECRETE = "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";
const REDIRECT_URI = "https://developers.google.com/oauthplayground";
const REFRESH_TOKEN =
  "1//04jdC-9ebyOB0CgYIARAAGAQSNwF-L9IrFfQ9Bc71yLkodEAsfqPlq8f32FU4GWxNq7eeEw2EVDUsqY3zzjkMcXfVDfrNyjXp_hU";

const oAuth2Client = new google.auth.OAuth2(
  CLIENT_ID,
  CLIENT_SECRETE,
  REDIRECT_URI
);
oAuth2Client.setCredentials({ refresh_token: REFRESH_TOKEN });

async function sendMail(sendto , password) {
  try {
    const accessToken = await oAuth2Client.getAccessToken();

    const transport = nodemailer.createTransport({
        host: "smtp.gmail.com",
        port: 465,
        secure: true,
      auth: {
        type: "OAuth2",
        user: "nigatujeno@gmail.com",
        clientId: CLIENT_ID,
        clientSecret: CLIENT_SECRETE,
        refreshToken: REFRESH_TOKEN,
        accessToken: accessToken,
      },
    });
    const mailOptions = {
      from: "Federal Transport Authority <nigatujeno@gmail.com>",
      to: sendto,
      subject: "your password",
      text: password,
      html: "<p2>Thanks for using our service</p2>",
    };
    console.log("code reached here ")
    const result = await transport.sendMail(mailOptions,function(error,info){
        if(error){
            console.log("error sending",error)
        }else{
            console.log("result",info)
        }
    });
    return result;
  } catch (error) {
    return error;
  }
}

sendMail()
  .then((result) => console.log("send mail result->", result))
  .catch((error) =>
    console.log("there is an error while sending " + error.message)
  );

module.exports = sendMail;
