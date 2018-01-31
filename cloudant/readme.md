### Create an IBM Cloudant Database

* Create an account on IBM Cloud
* Provision the Cloudant database
* Login to Cloudant
* Create a database titled `monsters`

### Clone the [pixelastic/monsters](https://github.com/pixelastic/monsters) repository

`git clone https://github.com/pixelastic/monsters.git`

`cd monsters/records`

### CRUD Operations

* Click on permissions and generate an API key
* Grant writer permissions to your new key

We're going to use [Postman](https://www.getpostman.com/) to interact with Cloundant over HTTP. Let's try adding a single monster to the database. Or, in this case, a harmless badger.

```json
{
  "alignement": "N",
  "challengeRating": "<1",
  "environment": [
    "Temperate Forests"
  ],
  "hitDice": "1",
  "homePlane": "Material",
  "image": null,
  "name": "Badger",
  "tags": [
    "Small animal"
  ],
  "type": "Small animal"
}
```

### Bulk Docs

* [jq](https://stedolan.github.io/jq/)
* [HTTPie](https://httpie.org/)

```bash
find . -name '*.json' -exec cat {} \; | jq -s '{"docs": [ .[] ]}' | http -a ###:### post https://5bf7ab22-9d65-400d-8db3-4aa44c4dd32e-bluemix.cloudant.com/monsters/_bulk_docs
```

### Views

```js
function(doc) {
  if (doc.alignement == "N")
    emit(doc.id, doc);
}
```

```js
function (doc) {
  if (doc.challengeRating >= parseInt(10) )
  {
    emit(doc.name, doc.challengeRating);
  }
}
```

### Search

```js
function(doc) {
    index("default", doc.name);
}
```
### Query
