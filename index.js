'use strict';

const ApiBuilder = require('claudia-api-builder');
const api = new ApiBuilder();
const greeter = require('./lib/greeter');

module.exports = api;

api.get('/greeting', (event, context) => {
    console.log('Event:', JSON.stringify(event));
    const greeting = greeter.greet(event.queryString.name);
    return {greeting: greeting};
});
