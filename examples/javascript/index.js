/*global process, require*/
const InsightsAdvisorApi = require('insights_advisor_api');
const defaultClient = InsightsAdvisorApi.ApiClient.instance;
const basicAuth = defaultClient.authentications['basicAuth'];
basicAuth.username = process.env.USERNAME;
basicAuth.password = process.env.PASSWORD;

const systemClient = new InsightsAdvisorApi.SystemApi();

const callback = function(error, data) {
  if (error) {
    console.error(error);
  } else {
      console.log(JSON.stringify(data, false, 2));
  }
};
systemClient.showSystem('fbe81170-b266-40c2-8ff0-481f5da00207', callback);


// const Promise = require('bluebird');
// const showSystem = Promise.promisify(systemClient.showSystem);
// showSystem('fbe81170-b266-40c2-8ff0-481f5da00207').then(() => {
//     console.log('fdsfs');
// });
