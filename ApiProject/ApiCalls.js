const pactum = require('pactum');

describe('Test', ()=>{

before (()=>{
    pactum.request.setBaseUrl("https://jsonplaceholder.typicode.com")
})

it('should return a json list of all users', async()=>{
    await pactum.spec()
    .get('/posts')
    .expectStatus(200)
    
});
it('should return a user with id 2', async()=>{
    await pactum.spec()
    .get('/posts')
    .withQueryParams('id', '2')
    .expectStatus(200)
    
});

it('should create a new user', async()=>{
    await pactum.spec()
    .post('/posts')
    .withJson({
    "userId": 10,
    "id": 98,
    "title": "qui est esse",
    "body": "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
        .expectStatus(201)
})
});
it('should PUT new data to a json'), async()=>{
    await pactum.spec()
    .put('/posts')
    .withQueryParams('id', '57')
    .withJson({
        "userId": 10,
        "id": 99,
        "title": "qui est esse",
        "body": "est rerum tempore vitae\nsequ"

    })
    .expectStatus(204)
)}

    

it('POST should return as conflict'), async()=>{
await pactum.spec()
.post('/posts')
.withJson({
"userId": 1,
"id": 1,
"title": "qui est esse",
"body": "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
    .expectStatus(409)
})
}
