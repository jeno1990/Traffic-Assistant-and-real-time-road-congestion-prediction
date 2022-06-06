
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const Device_location = new Schema(
    {
        latitude: { type: String }, 
        longitude: { type: String}, 
        speed: { type: Number}, 
        createdAt: { type: Date, default: Date.now, index: { expires: 300 } }, //set ttl, automatic deletion after 5m
    },
    {
        usePushEach: true,  
    },
);

module.exports = mongoose.model('devices', Device_location);
