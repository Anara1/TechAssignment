const pactum = require('pactum');
const { like } = require('pactum-matchers')
const ce = require('chai').expect


let response;
let hashcountNum;
let encodedpwd
describe('Test broken hash', ()=>{

    
before (()=>{
    pactum.request.setBaseUrl("http://127.0.0.1:8088/hash/")
})

it('should create a new password hash', async()=>{
    await pactum.spec()
    .post('/hash')
    .withJson({
    "password": "angrymonkey",
    })
        .expectStatus(200)
        .expectHeader('content-type', 'text/html; charset=UTF=8')
        .expectBodyContains(hashcountNum);

})
});

it('GET hashcount number returns 200', async()=>{
    await pactum.spec()
    .get('/hash/'+hashcountNum)
    .expectHeader('content-type', 'text/html; charset=UTF=8')
    .expectStatus(200)
    .expectBodyContains(encodedpwd)
    
});
it('GET stats', async()=>{
    await pactum.spec()
    .get('/stats')
    .expectHeader('content-type', 'application/json; charset=utf-8')
    .expectStatus(200)
    .expectJsonLike({"TotalRequests":Number,"AverageTime":Number})

    
});
it('POST shutdown', async()=>{
    await pactum.spec()
    .post('shutdown')
    .expectStatus(200)
})
