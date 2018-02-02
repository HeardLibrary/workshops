# Fundamentals of Document-Oriented Databases 

If you have lots of heterogeneous data, then document-oriented databases may be your solution. In this short workshop, we will show you how to set up [Cloudant](https://www.ibm.com/cloud/cloudant), a hosted version of [CouchDB](http://couchdb.apache.org/), and to query it using the [map/reduce](https://console.bluemix.net/docs/services/Cloudant/api/creating_views.html) paradigm.

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

It is also possible to upload multiple JSON documents at once using the `_bulk_docs` interface along with tools like [jq](https://stedolan.github.io/jq/) and [HTTPie](https://httpie.org/).

```bash
find . -name '*.json' -exec cat {} \; | jq -s '{"docs": [ .[] ]}' | http -a ###:### post https://5bf7ab22-9d65-400d-8db3-4aa44c4dd32e-bluemix.cloudant.com/monsters/_bulk_docs
```

### Views

* Which of the monsters are indifferent?

```js
function (doc) {
  if (doc.alignement == "N")
    emit(doc.name, doc.alignement);
}
```

```
http get https://5bf7ab22-9d65-400d-8db3-4aa44c4dd32e-bluemix.cloudant.com/monsters/_design/monsters/_view/neutral
```

* What are the most dangerous monsters?

```js
function (doc) {
  if (doc.challengeRating >= parseInt(10) )
  {
    emit(doc.name, doc.challengeRating);
  }
}
```

```
http get https://5bf7ab22-9d65-400d-8db3-4aa44c4dd32e-bluemix.cloudant.com/monsters/_design/monsters/_view/big-monsters
```

### Reduce

* How many monsters of various alignments are there?

```js
function (doc) {
  emit(doc.alignement, 1);
}
```

We'll use a built-in reduce function to count up the totals: `_sum`.

We can test out this map/reduce function by calling it with the appropriate query string values.

```
http get https://5bf7ab22-9d65-400d-8db3-4aa44c4dd32e-bluemix.cloudant.com/monsters/_design/monsters/_view/good-bad-indifferent reduce=true key=N
```


### Search

* What are the names of the vampires?

```js
function(doc) {
    index("default", doc.name);
}
```

```
http get https://5bf7ab22-9d65-400d-8db3-4aa44c4dd32e-bluemix.cloudant.com/monsters/_design/monsters/_search/name q==vampire
```

