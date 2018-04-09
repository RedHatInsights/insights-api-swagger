/*global process, require*/
const api = require('../../clients/typescript-node/api');
const systemClient = new api.SystemApi(process.env.USERNAME, process.env.PASSWORD);

systemClient.showSystem('b8acea6a3d2340498c90bbd043d0bfca').then((data) => {
    console.log(data.body);
});
