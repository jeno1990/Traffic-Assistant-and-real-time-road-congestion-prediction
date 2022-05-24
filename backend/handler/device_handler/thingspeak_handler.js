const fetch = (...args) => import('node-fetch').then(({default: fetch}) => fetch(...args));
const API_KEY="8UHT67ITOFDGRDHG";

const thingspeak_handler= async (req,res)=>{
    console.log("endponit");
    const url=`https://api.thingspeak.com/channels/1638300/feeds.json?api_key=${API_KEY}&results=2`;
    const options={
      'method':"GET",
    };
    const response=await fetch(url,options)
    .then(res=>res.json())
    .catch(e =>{
      console.error({
        'message':"oh no",
         error:e,
      }

      );
    });
    console.log("response :",response);
  res.json(response);
  const thing=JSON.parse(JSON.stringify(response.feeds[0]));
  //field value
  console.log(thing.field1);

  }
  module.exports={
      thingspeak_handler
  } 