# Sample GraphQL API

This tutorial create a simple GraphQL server in Python, use the `graphene` library.

Here are the steps to set up a basic GraphQL server:

1. **Install Required Libraries**:

- Install `graphene` and `Flask`:

    ```
    pip install graphene Flask
    ```

2. **Create the GraphQL Schema**:

- Define your data model and schema using Graphene.

3. **Set Up the Flask Application**:

- Integrate Graphene with Flask to serve the GraphQL endpoint.

Here's an example of a simple GraphQL server using `graphene` and `Flask`:

```python
# Install the required packages
# pip install graphene Flask

from flask import Flask, request
from graphene import ObjectType, String, Schema, Field

# Define a simple query
class Query(ObjectType):
    hello = String(name=String(default_value="stranger"))

    def resolve_hello(root, info, name):
        return f"Hello, {name}!"

# Create the schema
schema = Schema(query=Query)

# Set up the Flask app
app = Flask(__name__)

# Create a GraphQL endpoint
@app.route("/graphql", methods=["POST"])
def graphql():
    data = request.get_json()
    result = schema.execute(data.get("query"))
    return {"data": result.data}

# Run the Flask app
if __name__ == "__main__":
    app.run(debug=True)
```

4. **Run the Flask Application**:

   - Save the code in a file, for example, `app.py`.
   - Run the Flask app:
     ```
     python app.py
     ```

5. **Test Your GraphQL Server**:
   - You can send a POST request to `http://localhost:5000/graphql` with a GraphQL query.

Example query:
```json
{
  "query": "{ hello(name: \"World\") }"
}
```

This will return:
```json
{
  "data": {
    "hello": "Hello, World!"
  }
}
```

CURL

```bash
curl -X POST http://localhost:5000/graphql \
     -H "Content-Type: application/json" \
     -d '{"query": "{ hello(name: \"World\") }"}'
```

This sets up a basic GraphQL server in Python using the `graphene` and `Flask` libraries.

